Content-Type: multipart/mixed; boundary="===============3764523484289315817=="
MIME-Version: 1.0
From: Peter Xu <peterx@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 05/14] KVM: X86: Implement ring-based dirty memory tracking
Date: Mon, 25 May 2020 11:26:49 -0400
Message-ID: <20200525152649.GF1058657@xz-x1>
In-Reply-To: <202005251058.wRNkniwm%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3764523484289315817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 10:48:08AM +0800, kbuild test robot wrote:
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
> config: s390-randconfig-s002-20200524 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 ARCH=3Ds390 CF=3D'-fdiagnostic-prefix -D__CHECK_=
ENDIAN__'
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_page_in_dirt=
y_ring':
> >> arch/s390/kvm/../../../virt/kvm/kvm_main.c:2932:16: warning: compariso=
n of unsigned expression >=3D 0 is always true [-Wtype-limits]
> 2932 |  return (pgoff >=3D KVM_DIRTY_LOG_PAGE_OFFSET) &&
> |                ^~

Should be a false positive, since when KVM_DIRTY_LOG_PAGE_OFFSET=3D=3D0 (tr=
ue for
s390) then the code won't reach here at all due to the previous check [1].

I thought gcc should be able to directly remove the below code when it sees=
 "if
(1) return false;", but it seems not...

I wanted to avoid using "#if" macros because I think it always makes the co=
de
harder to read (especially when nested).  Maybe it's still ok to use one mo=
re
time here.

Thanks,

> =

> vim +2932 arch/s390/kvm/../../../virt/kvm/kvm_main.c
> =

>   2926	=

>   2927	static bool kvm_page_in_dirty_ring(struct kvm *kvm, unsigned long =
pgoff)
>   2928	{
>   2929		if (!KVM_DIRTY_LOG_PAGE_OFFSET)
>   2930			return false;

[1]

>   2931	=

> > 2932		return (pgoff >=3D KVM_DIRTY_LOG_PAGE_OFFSET) &&
>   2933		    (pgoff < KVM_DIRTY_LOG_PAGE_OFFSET +
>   2934		     kvm->dirty_ring_size / PAGE_SIZE);
>   2935	}
>   2936	=



-- =

Peter Xu

--===============3764523484289315817==--

