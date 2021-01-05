Content-Type: multipart/mixed; boundary="===============7131359395255792249=="
MIME-Version: 1.0
From: Dennis Zhou <dennis@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] percpu: fix clang modpost warning in pcpu_build_alloc_info()
Date: Tue, 05 Jan 2021 00:55:06 +0000
Message-ID: <X/O46grb51Z4faI1@google.com>
In-Reply-To: <20210104234651.GA3548546@ubuntu-m3-large-x86>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7131359395255792249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 04:46:51PM -0700, Nathan Chancellor wrote:
> On Thu, Dec 31, 2020 at 09:28:52PM +0000, Dennis Zhou wrote:
> > This is an unusual situation so I thought it best to explain it in a
> > separate patch.
> > =

> > "percpu: reduce the number of cpu distance comparisons" introduces a
> > dependency on cpumask helper functions in __init code. This code
> > references a struct cpumask annotated __initdata. When the function is
> > inlined (gcc), everything is fine, but clang decides not to inline these
> > function calls. This causes modpost to warn about an __initdata access
> > by a function not annotated with __init [1].
> > =

> > Ways I thought about fixing it:
> > 1. figure out why clang thinks this inlining is too costly.
> > 2. create a wrapper function annotated __init (this).
> > 3. annotate cpumask with __refdata.
> > =

> > Ultimately it comes down to if it's worth saving the cpumask memory and
> > allowing it to be freed. IIUC, __refdata won't be freed, so option 3 is
> > just a little wasteful. 1 is out of my depth, leaving 2. I don't feel
> > great about this behavior being dependent on inlining semantics, but
> > cpumask helpers are small and probably should be inlined.
> > =

> > modpost complaint:
> >   WARNING: modpost: vmlinux.o(.text+0x735425): Section mismatch in refe=
rence from the function cpumask_clear_cpu() to the variable .init.data:pcpu=
_build_alloc_info.mask
> >   The function cpumask_clear_cpu() references
> >   the variable __initdata pcpu_build_alloc_info.mask.
> >   This is often because cpumask_clear_cpu lacks a __initdata
> >   annotation or the annotation of pcpu_build_alloc_info.mask is wrong.
> > =

> > clang output:
> >   mm/percpu.c:2724:5: remark: cpumask_clear_cpu not inlined into pcpu_b=
uild_alloc_info because too costly to inline (cost=3D725, threshold=3D325) =
[-Rpass-missed=3Dinline]
> > =

> > [1] https://lore.kernel.org/linux-mm/202012220454.9F6Bkz9q-lkp(a)intel.=
com/
> > =

> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Dennis Zhou <dennis@kernel.org>
> > ---
> > This is on top of percpu#for-5.12.
> > =

> >  mm/percpu.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > =

> > diff --git a/mm/percpu.c b/mm/percpu.c
> > index 80f8f885a990..357977c4cb00 100644
> > --- a/mm/percpu.c
> > +++ b/mm/percpu.c
> > @@ -2642,6 +2642,18 @@ early_param("percpu_alloc", percpu_alloc_setup);
> >  =

> >  /* pcpu_build_alloc_info() is used by both embed and page first chunk =
*/
> >  #if defined(BUILD_EMBED_FIRST_CHUNK) || defined(BUILD_PAGE_FIRST_CHUNK)
> > +
> > +/*
> > + * This wrapper is to avoid a warning where cpumask_clear_cpu() is not=
 inlined
> > + * when compiling with clang causing modpost to warn about accessing _=
_initdata
> > + * from a non __init function.  By doing this, we allow the struct cpu=
mask to be
> > + * freed instead of it taking space by annotating with __refdata.
> > + */
> > +static void __init pcpu_cpumask_clear_cpu(int cpu, struct cpumask *mas=
k)
> > +{
> > +	cpumask_clear_cpu(cpu, mask);
> > +}
> > +
> >  /**
> >   * pcpu_build_alloc_info - build alloc_info considering distances betw=
een CPUs
> >   * @reserved_size: the size of reserved percpu area in bytes
> > @@ -2713,7 +2725,7 @@ static struct pcpu_alloc_info * __init pcpu_build=
_alloc_info(
> >  		cpu =3D cpumask_first(&mask);
> >  		group_map[cpu] =3D group;
> >  		group_cnt[group]++;
> > -		cpumask_clear_cpu(cpu, &mask);
> > +		pcpu_cpumask_clear_cpu(cpu, &mask);
> >  =

> >  		for_each_cpu(tcpu, &mask) {
> >  			if (!cpu_distance_fn ||
> > @@ -2721,7 +2733,7 @@ static struct pcpu_alloc_info * __init pcpu_build=
_alloc_info(
> >  			     cpu_distance_fn(tcpu, cpu) =3D=3D LOCAL_DISTANCE)) {
> >  				group_map[tcpu] =3D group;
> >  				group_cnt[group]++;
> > -				cpumask_clear_cpu(tcpu, &mask);
> > +				pcpu_cpumask_clear_cpu(tcpu, &mask);
> >  			}
> >  		}
> >  	}
> > -- =

> > 2.29.2.729.g45daf8777d-goog
> > =


Hi Nathan,

> =

> Hi Dennis,
> =

> I did a bisect of the problematic config against defconfig and it points
> out that CONFIG_GCOV_PROFILE_ALL is in the bad config but not the good
> config, which makes some sense as that will mess with clang's inlining
> heuristics. It does not appear to be the single config that makes a
> difference but it gives some clarity.
> =


Ah, thanks. To me it's kind of a corner case that I don't have a lot of
insight into. __init code is pretty limited and this warning is really
at the compilers whim. However, in this case only clang throws this
warning.

> I do not personally have any strong opinions around the patch but is it
> really that much wasted memory to just annotate mask with __refdata?

It's really not much memory, 1 bit per max # of cpus. The reported
config is on the extreme side compiling with 8k NR_CPUS, so 1kb. I'm
just not in love with the idea of adding a patch to improve readability
and it cost idle memory to resolve a compile time warning.

If no one else chimes in in the next few days, I'll probably just apply
it and go from there. If another issue comes up I'll drop this and tag
it as __refdata.

Thanks,
Dennis
--===============7131359395255792249==--

