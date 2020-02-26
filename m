Content-Type: multipart/mixed; boundary="===============6589642133626829484=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: kbuild-all@lists.01.org
Subject: Re: [block:block-5.6 2/3] kernel/trace/blktrace.c:347:12: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Wed, 26 Feb 2020 14:56:25 +0100
Message-ID: <20200226135625.GR10728@quack2.suse.cz>
In-Reply-To: <202002261622.EZx3EFwO%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6589642133626829484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 26-02-20 16:44:35, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git block-5.6
> head:   93d7c3185893b185e7f4347f8986b9b521254a6e
> commit: c780e86dd48ef6467a1146cf7d0fe1e05a635039 [2/3] blktrace: Protect =
q->blk_trace with RCU
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-173-ge0787745-dirty
>         git checkout c780e86dd48ef6467a1146cf7d0fe1e05a635039
>         make ARCH=3Dx86_64 allmodconfig
>         make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> =

> sparse warnings: (new ones prefixed by >>)
> =

> >> kernel/trace/blktrace.c:347:12: sparse: sparse: incorrect type in assi=
gnment (different address spaces)
> >> kernel/trace/blktrace.c:347:12: sparse:    expected struct blk_trace *=
bt
> >> kernel/trace/blktrace.c:347:12: sparse:    got struct blk_trace [noder=
ef] <asn:4> *[assigned] __ret

Yeah, this is for stuff like xchg(&q->blk_trace, NULL) because blk_trace is
now rcu protected pointer. I'm not aware of a way to annotate xchg() to
make sparse happy. However looking at the code we seem to be always holding
q->blk_trace_mutex these days when modifying q->blk_trace so using
rcu_assign_pointer() instead of these atomic operations should be actually
safe. I'll send a followup cleanup patch with this.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============6589642133626829484==--

