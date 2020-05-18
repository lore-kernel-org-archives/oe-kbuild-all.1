Content-Type: multipart/mixed; boundary="===============1877890078221650953=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [kvm:queue 71/177] arch/x86/kvm/vmx/nested.c:5246:3: error: variable 'roots_to_free' is used uninitialized whenever 'if' condition is false
Date: Mon, 18 May 2020 12:16:00 -0700
Message-ID: <CAKwvOdmqf-0Y2GrY=SzGQr1UC3n=b_SphdB9efkqic=5ZaR9vA@mail.gmail.com>
In-Reply-To: <202005162313.CDreQC6s%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1877890078221650953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 8:39 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   cb953129bfe5c0f2da835a0469930873fb7e71df
> commit: ce8fe7b77bd8ee405295e349c82d0ef8c9788200 [71/177] KVM: nVMX: Free=
 only the affected contexts when emulating INVEPT
> config: x86_64-randconfig-a012-20200515 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 13d4=
4b2a0c7ef404b13b16644765977cd5310fe2)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout ce8fe7b77bd8ee405295e349c82d0ef8c9788200
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> Note: the kvm/queue HEAD cb953129bfe5c0f2da835a0469930873fb7e71df builds =
fine.
>       It only hurts bisectibility.
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> arch/x86/kvm/vmx/nested.c:5246:3: error: variable 'roots_to_free' is u=
sed uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uni=
nitialized]
> BUG_ON(1);
> ^~~~~~~~~
> include/asm-generic/bug.h:62:32: note: expanded from macro 'BUG_ON'
> #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
> ^~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler.h:56:28: note: expanded from macro 'if'
> #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
> #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tra=
ce_if_value(cond))
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/kvm/vmx/nested.c:5250:6: note: uninitialized use occurs here
> if (roots_to_free)
> ^~~~~~~~~~~~~
> include/linux/compiler.h:56:47: note: expanded from macro 'if'
> #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> ^~~~
> include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
> #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tra=
ce_if_value(cond))
> ^~~~
> arch/x86/kvm/vmx/nested.c:5246:3: note: remove the 'if' if its condition =
is always true
> BUG_ON(1);
> ^
> include/asm-generic/bug.h:62:32: note: expanded from macro 'BUG_ON'
> #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
> ^
> include/linux/compiler.h:56:23: note: expanded from macro 'if'
> #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
> ^
> arch/x86/kvm/vmx/nested.c:5179:35: note: initialize the variable 'roots_t=
o_free' to silence this warning
> unsigned long type, roots_to_free;
> ^
> =3D 0
> 1 error generated.
>
> vim +5246 arch/x86/kvm/vmx/nested.c
>
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5173
> 55d2375e58a61b Sean Christopherson 2018-12-03  5174  /* Emulate the INVEP=
T instruction */
> 55d2375e58a61b Sean Christopherson 2018-12-03  5175  static int handle_in=
vept(struct kvm_vcpu *vcpu)
> 55d2375e58a61b Sean Christopherson 2018-12-03  5176  {
> 55d2375e58a61b Sean Christopherson 2018-12-03  5177     struct vcpu_vmx *=
vmx =3D to_vmx(vcpu);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5178     u32 vmx_instructi=
on_info, types;
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5179     unsigned long typ=
e, roots_to_free;

^ definition of roots_to_free

> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5180     struct kvm_mmu *m=
mu;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5181     gva_t gva;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5182     struct x86_except=
ion e;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5183     struct {
> 55d2375e58a61b Sean Christopherson 2018-12-03  5184             u64 eptp,=
 gpa;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5185     } operand;
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5186     int i;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5187
> 55d2375e58a61b Sean Christopherson 2018-12-03  5188     if (!(vmx->nested=
.msrs.secondary_ctls_high &
> 55d2375e58a61b Sean Christopherson 2018-12-03  5189           SECONDARY_E=
XEC_ENABLE_EPT) ||
> 55d2375e58a61b Sean Christopherson 2018-12-03  5190         !(vmx->nested=
.msrs.ept_caps & VMX_EPT_INVEPT_BIT)) {
> 55d2375e58a61b Sean Christopherson 2018-12-03  5191             kvm_queue=
_exception(vcpu, UD_VECTOR);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5192             return 1;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5193     }
> 55d2375e58a61b Sean Christopherson 2018-12-03  5194
> 55d2375e58a61b Sean Christopherson 2018-12-03  5195     if (!nested_vmx_c=
heck_permission(vcpu))
> 55d2375e58a61b Sean Christopherson 2018-12-03  5196             return 1;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5197
> 55d2375e58a61b Sean Christopherson 2018-12-03  5198     vmx_instruction_i=
nfo =3D vmcs_read32(VMX_INSTRUCTION_INFO);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5199     type =3D kvm_regi=
ster_readl(vcpu, (vmx_instruction_info >> 28) & 0xf);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5200
> 55d2375e58a61b Sean Christopherson 2018-12-03  5201     types =3D (vmx->n=
ested.msrs.ept_caps >> VMX_EPT_EXTENT_SHIFT) & 6;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5202
> 55d2375e58a61b Sean Christopherson 2018-12-03  5203     if (type >=3D 32 =
|| !(types & (1 << type)))
> 55d2375e58a61b Sean Christopherson 2018-12-03  5204             return ne=
sted_vmx_failValid(vcpu,
> 55d2375e58a61b Sean Christopherson 2018-12-03  5205                      =
       VMXERR_INVALID_OPERAND_TO_INVEPT_INVVPID);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5206
> 55d2375e58a61b Sean Christopherson 2018-12-03  5207     /* According to t=
he Intel VMX instruction reference, the memory
> 55d2375e58a61b Sean Christopherson 2018-12-03  5208      * operand is rea=
d even if it isn't needed (e.g., for type=3D=3Dglobal)
> 55d2375e58a61b Sean Christopherson 2018-12-03  5209      */
> 55d2375e58a61b Sean Christopherson 2018-12-03  5210     if (get_vmx_mem_a=
ddress(vcpu, vmcs_readl(EXIT_QUALIFICATION),
> fdb28619a8f033 Eugene Korenevsky   2019-06-06  5211                     v=
mx_instruction_info, false, sizeof(operand), &gva))
> 55d2375e58a61b Sean Christopherson 2018-12-03  5212             return 1;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5213     if (kvm_read_gues=
t_virt(vcpu, gva, &operand, sizeof(operand), &e)) {
> ee1fa209f5e5ca Junaid Shahid       2020-03-20  5214             kvm_injec=
t_emulated_page_fault(vcpu, &e);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5215             return 1;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5216     }
> 55d2375e58a61b Sean Christopherson 2018-12-03  5217
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5218     /*
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5219      * Nested EPT roo=
ts are always held through guest_mmu,
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5220      * not root_mmu.
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5221      */
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5222     mmu =3D &vcpu->ar=
ch.guest_mmu;
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5223
> 55d2375e58a61b Sean Christopherson 2018-12-03  5224     switch (type) {
> b119019847fbca Jim Mattson         2019-06-13  5225     case VMX_EPT_EXTE=
NT_CONTEXT:
> eed0030e4caa94 Sean Christopherson 2020-03-20  5226             if (!nest=
ed_vmx_check_eptp(vcpu, operand.eptp))
> eed0030e4caa94 Sean Christopherson 2020-03-20  5227                     r=
eturn nested_vmx_failValid(vcpu,
> eed0030e4caa94 Sean Christopherson 2020-03-20  5228                      =
       VMXERR_INVALID_OPERAND_TO_INVEPT_INVVPID);
> f8aa7e3958bc43 Sean Christopherson 2020-03-20  5229
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5230             roots_to_=
free =3D 0;

^ assignment

> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5231             if (neste=
d_ept_root_matches(mmu->root_hpa, mmu->root_cr3,
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5232                      =
                   operand.eptp))
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5233                     r=
oots_to_free |=3D KVM_MMU_ROOT_CURRENT;
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5234
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5235             for (i =
=3D 0; i < KVM_MMU_NUM_PREV_ROOTS; i++) {
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5236                     i=
f (nested_ept_root_matches(mmu->prev_roots[i].hpa,
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5237                      =
                           mmu->prev_roots[i].cr3,
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5238                      =
                           operand.eptp))
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5239                      =
       roots_to_free |=3D KVM_MMU_ROOT_PREVIOUS(i);
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5240             }
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5241             break;
> eed0030e4caa94 Sean Christopherson 2020-03-20  5242     case VMX_EPT_EXTE=
NT_GLOBAL:
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5243             roots_to_=
free =3D KVM_MMU_ROOTS_ALL;

^ assignment

> 55d2375e58a61b Sean Christopherson 2018-12-03  5244             break;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5245     default:
> 55d2375e58a61b Sean Christopherson 2018-12-03 @5246             BUG_ON(1);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5247             break;
> 55d2375e58a61b Sean Christopherson 2018-12-03  5248     }
> 55d2375e58a61b Sean Christopherson 2018-12-03  5249
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5250     if (roots_to_free)

^ use

While the BUG_ON in the default case should prevent the problematic
use, Clang can't understand the semantics of BUG_ON.  roots_to_free
should just be initialized to zero.

> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5251             kvm_mmu_f=
ree_roots(vcpu, mmu, roots_to_free);
> ce8fe7b77bd8ee Sean Christopherson 2020-03-20  5252
> 55d2375e58a61b Sean Christopherson 2018-12-03  5253     return nested_vmx=
_succeed(vcpu);
> 55d2375e58a61b Sean Christopherson 2018-12-03  5254  }
> 55d2375e58a61b Sean Christopherson 2018-12-03  5255
>
> :::::: The code at line 5246 was first introduced by commit
> :::::: 55d2375e58a61be072431dd3d3c8a320f4a4a01b KVM: nVMX: Move nested co=
de to dedicated files
>
> :::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
> :::::: CC: Paolo Bonzini <pbonzini@redhat.com>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202005162313.CDreQC6s%25lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============1877890078221650953==--

