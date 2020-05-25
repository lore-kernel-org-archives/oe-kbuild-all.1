Content-Type: multipart/mixed; boundary="===============5217029307281702330=="
MIME-Version: 1.0
From: Peter Xu <peterx@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 05/14] KVM: X86: Implement ring-based dirty memory tracking
Date: Mon, 25 May 2020 11:33:47 -0400
Message-ID: <20200525153347.GG1058657@xz-x1>
In-Reply-To: <202005252245.ZeOB8qNJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5217029307281702330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 10:54:58PM +0800, kbuild test robot wrote:
> Hi Peter,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on vhost/linux-next]
> [also build test WARNING on linus/master v5.7-rc7]
> [cannot apply to kvm/linux-next tip/auto-latest linux/master next-2020052=
2]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Peter-Xu/KVM-Dirty-ring-=
interface/20200524-070926
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git lin=
ux-next
> config: x86_64-allyesconfig (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build):
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> arch/x86/kvm/../../../virt/kvm/dirty_ring.c:33:6: warning: no previous=
 prototype for 'kvm_dirty_ring_full' [-Wmissing-prototypes]
> bool kvm_dirty_ring_full(struct kvm_dirty_ring *ring)
> ^~~~~~~~~~~~~~~~~~~

I'll add a "static" to quiesce this..

> --
> arch/x86/kvm/vmx/vmx.c: In function 'init_rmode_identity_map':
> >> arch/x86/kvm/vmx/vmx.c:3472:12: warning: variable 'identity_map_pfn' s=
et but not used [-Wunused-but-set-variable]
> kvm_pfn_t identity_map_pfn;
> ^~~~~~~~~~~~~~~~

Hmm, this seems to be true but not related to this series afaict...  but su=
re I
can add another patch to remove it.

> =

> vim +/kvm_dirty_ring_full +33 arch/x86/kvm/../../../virt/kvm/dirty_ring.c
> =

>     32	=

>   > 33	bool kvm_dirty_ring_full(struct kvm_dirty_ring *ring)
>     34	{
>     35		return kvm_dirty_ring_used(ring) >=3D ring->size;
>     36	}
>     37	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Peter Xu

--===============5217029307281702330==--

