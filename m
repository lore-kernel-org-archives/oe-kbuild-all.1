Content-Type: multipart/mixed; boundary="===============4412389424490352959=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rppt:pg_table/v0.0 5/18] include/linux/compiler_types.h:129:35: error: 'struct mm_struct' has no member named 'pgd'
Date: Sun, 02 Feb 2020 15:33:30 +0800
Message-ID: <202002021540.Xepbe4Ir%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4412389424490352959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git pg_t=
able/v0.0
head:   fd150c5a9ef6e3e43818825c69a46de2b427dedf
commit: e5db6ff88e6ef1ff9ab6fefb7ec882d7e329f783 [5/18] mm: move pgd into '=
struct pg_table'
config: mips-malta_kvm_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 5.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout e5db6ff88e6ef1ff9ab6fefb7ec882d7e329f783
        # save the attached .config to linux build tree
        GCC_VERSION=3D5.5.0 make.cross ARCH=3Dmips =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/tlbex.h:5:0,
                    from arch/mips//kvm/entry.c:19:
   arch/mips//kvm/entry.c: In function 'kvm_mips_build_enter_guest':
>> include/linux/compiler_types.h:129:35: error: 'struct mm_struct' has no =
member named 'pgd'
    #define __compiler_offsetof(a, b) __builtin_offsetof(a, b)
                                      ^
   arch/mips/include/asm/uasm.h:230:57: note: in definition of macro 'UASM_=
i_LW'
    # define UASM_i_LW(buf, rs, rt, off) uasm_i_lw(buf, rs, rt, off)
                                                            ^
   include/linux/stddef.h:17:32: note: in expansion of macro '__compiler_of=
fsetof'
    #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE, MEMBER)
                                   ^
>> arch/mips//kvm/entry.c:413:25: note: in expansion of macro 'offsetof'
     UASM_i_LW(&p, A0, (int)offsetof(struct mm_struct, pgd) -
                            ^
--
   arch/mips//kvm/mmu.c: In function 'kvm_mips_pte_for_gpa':
>> arch/mips//kvm/mmu.c:177:43: error: 'struct mm_struct' has no member nam=
ed 'pgd'
     return kvm_mips_walk_pgd(kvm->arch.gpa_mm.pgd, cache, addr);
                                              ^
   arch/mips//kvm/mmu.c: In function 'kvm_mips_flush_gpa_pt':
   arch/mips//kvm/mmu.c:301:48: error: 'struct mm_struct' has no member nam=
ed 'pgd'
     return kvm_mips_flush_gpa_pgd(kvm->arch.gpa_mm.pgd,
                                                   ^
   arch/mips//kvm/mmu.c: In function 'kvm_mips_mkclean_gpa_pt':
   arch/mips//kvm/mmu.c:425:46: error: 'struct mm_struct' has no member nam=
ed 'pgd'
     return kvm_mips_mkclean_pgd(kvm->arch.gpa_mm.pgd,
                                                 ^
   arch/mips//kvm/mmu.c: In function 'kvm_mips_mkold_gpa_pt':
   arch/mips//kvm/mmu.c:463:44: error: 'struct mm_struct' has no member nam=
ed 'pgd'
     return kvm_mips_mkold_pgd(kvm->arch.gpa_mm.pgd,
                                               ^
   arch/mips//kvm/mmu.c: In function 'kvm_trap_emul_pte_for_gva':
   arch/mips//kvm/mmu.c:799:36: error: 'struct mm_struct' has no member nam=
ed 'pgd'
      pgdp =3D vcpu->arch.guest_kernel_mm.pgd;
                                       ^
   arch/mips//kvm/mmu.c:801:34: error: 'struct mm_struct' has no member nam=
ed 'pgd'
      pgdp =3D vcpu->arch.guest_user_mm.pgd;
                                     ^
   arch/mips//kvm/mmu.c: In function 'kvm_trap_emul_invalidate_gva':
   arch/mips//kvm/mmu.c:814:35: error: 'struct mm_struct' has no member nam=
ed 'pgd'
     pgdp =3D vcpu->arch.guest_kernel_mm.pgd;
                                      ^
   arch/mips//kvm/mmu.c:822:34: error: 'struct mm_struct' has no member nam=
ed 'pgd'
      pgdp =3D vcpu->arch.guest_user_mm.pgd;
                                     ^
   arch/mips//kvm/mmu.c: In function 'kvm_mips_flush_gpa_pt':
   arch/mips//kvm/mmu.c:304:1: error: control reaches end of non-void funct=
ion [-Werror=3Dreturn-type]
    }
    ^
   arch/mips//kvm/mmu.c: In function 'kvm_mips_mkclean_gpa_pt':
   arch/mips//kvm/mmu.c:428:1: error: control reaches end of non-void funct=
ion [-Werror=3Dreturn-type]
    }
    ^
   arch/mips//kvm/mmu.c: In function 'kvm_mips_pte_for_gpa':
   arch/mips//kvm/mmu.c:178:1: error: control reaches end of non-void funct=
ion [-Werror=3Dreturn-type]
    }
    ^
   arch/mips//kvm/mmu.c: In function 'kvm_mips_mkold_gpa_pt':
   arch/mips//kvm/mmu.c:466:1: error: control reaches end of non-void funct=
ion [-Werror=3Dreturn-type]
    }
    ^
   cc1: all warnings being treated as errors
--
   arch/mips//kvm/trap_emul.c: In function 'kvm_trap_emul_vcpu_uninit':
>> arch/mips//kvm/trap_emul.c:607:54: error: 'struct mm_struct' has no memb=
er named 'pgd'
     kvm_mips_emul_free_gva_pt(vcpu->arch.guest_kernel_mm.pgd);
                                                         ^
   arch/mips//kvm/trap_emul.c:608:52: error: 'struct mm_struct' has no memb=
er named 'pgd'
     kvm_mips_emul_free_gva_pt(vcpu->arch.guest_user_mm.pgd);
                                                       ^

vim +129 include/linux/compiler_types.h

71391bdd2e9aab Xiaozhou Liu 2018-12-14  128  =

71391bdd2e9aab Xiaozhou Liu 2018-12-14 @129  #define __compiler_offsetof(a,=
 b)	__builtin_offsetof(a, b)
71391bdd2e9aab Xiaozhou Liu 2018-12-14  130  =


:::::: The code at line 129 was first introduced by commit
:::::: 71391bdd2e9aab188f86bf1ecd9b232531ec7eea include/linux/compiler_type=
s.h: don't pollute userspace with macro definitions

:::::: TO: Xiaozhou Liu <liuxiaozhou@bytedance.com>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============4412389424490352959==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICLQSNl4AAy5jb25maWcAjDzbcuM2su/5CtXkJalNsr6NMtlTfgBJUEJEEhwAlCW/sBSPZuJa
30qWk83fn27wBoAA5aqtzQjdaDSAvqPp77/7fkbejs+Pu+P93e7h4Z/Zt/3T/rA77r/Mvt4/7P9v
lvBZwdWMJkz9AsjZ/dPb//79eP/yOvv4y9UvZz8f7j7NVvvD0/5hFj8/fb3/9gaz75+fvvv+O/jf
9zD4+AKEDv+Z4aT9w88PSOHnb3d3sx8WcfwjkPn4yxmgxrxI2aKO45rJGiDX/3RD8KNeUyEZL64/
nn08O+txM1IsetCZQWJJZE1kXi+44gOhFnBDRFHnZBvRuipYwRQjGbulyYDIxOf6hovVMBJVLEsU
y2lNN4pEGa0lFwrgepMLfWgPs9f98e1l2AvSrmmxrolY1BnLmbq+vMAzadnhecmAkqJSze5fZ0/P
R6QwICwpSagYwVtoxmOSdZv/8ME3XJPK3L/eRC1Jpgz8JVnTekVFQbN6ccvKAd2ERAC58IOy25z4
IZvb0AweAlwNAJun/lBMhrynZrA1Bd/cTs/m0+Arz40kNCVVpuoll6ogOb3+8MPT89P+x/6s5Q0x
zldu5ZqV8WgA/xurzNx0ySXb1PnnilbUs3AsuJR1TnMutjVRisRLc3YlacYi735IBYptQrQ8g/zP
Xt/+eP3n9bh/HOR5QQsqWKzVoxQ8ooaOGiC55Dd+CE1TGisGF07SFFRQrvx48dKUQxxJeE5Y4Rur
l4wKIuLl1k+LlcwUtiIBjWtnAtimmHIR06RWSwGax4qFeYgmzYRG1SKV9onun77Mnr86Z9dRRwbB
XvF4JXkFi9QJUWTMsLYwa7x/kmVjsCZA17RQ0gPMuayrEgjTzi6p+8f94dV3lYrFq5oXFO5KDaQK
Xi9v0S7lvDD3DoMlrMETFnukr5nF4GAdSsa5s8WyFlTqDQqpabfnNeKxm1MKSvNSAamCWrrQjq95
VhWKiK1XsFuskWjHZfVvtXv97+wI6852wMPrcXd8ne3u7p7fno73T9+cQ4IJNYljDms5EoGSoC9s
AHtZiWSC6hJT0FFA9dt6BcogFVHSvxvJvML2jt30NgL2wSTPiGL6cvVpiLiaSY90wOHVADN3Cz/B
94EY+HyRbJDN6fYQzobtZdkgXQakoKB1ki7iKGNSmdJhM2ic/ar5h/e02KrxnNLrNdEPpmCkWKqu
zz+a43hEOdmY8ItBGlmhVuA8U+rSuHQ1UcZL2I9W1u6g5d2f+y9vEAfNvu53x7fD/lUPt7v0QI0w
YSF4Vfr2gj5GlgQEazjOSsm6MH6jPymk4w0EDHnolSyx5hZUOXNhY/Gq5HAUqM2KC+q9gOYAMPjQ
vPtxtjKVYElBUWMwWYmHH0EzsjWXj7IVzFjrwEr4ZkCEx0vQSQjn0Jij1YL/5KSILRPiokn4h4ea
Dk0gYkpAmkBuk8Zq1xRDuaLTo57oJKJPZzovb/0GHYtpiVNAjUhMr+1AqYxluYJ9gRrjxozYrkyH
H42eDr9ziEoY3rux2oIqdMD1yNk0FzMMmzeGDLYQz47Sxr0OpJqwpbf5liq5v+siNxw1+FdjO1kK
pypMwsFjIBKutDL3k1aKbpyftRkU0JJb+2eLgmSpkQ7oDZgD2gWbA3IJwdfwkzAjwGW8rkTjOjpw
smbAZnuQxskAkYgIwcyLWiHKNrfUsBur/ffQg/VpoBZhzGUpUpn67tGyETqWTb16Kelnk5oOh/So
lxhsiiaJV8MbmYa1ajeq0YPARr3OgUkeWxFAfH52NfLsbRZa7g9fnw+Pu6e7/Yz+tX8Cb0jAysbo
DyHQGJycvayzGXd5r/d954rdguu8Wa7W0UIXBhnJIFF1JFY+U5GRyNLErPKH8zLjUWA+CJdY0C5H
sakBNAWfjc63FqDDPPdTX1ZpCuFzSYCQPhYCLsBv2hTNGyMIqShLWTwylxARpSxzYqY+gADLp92M
FSraaXavNKyUnZvNd3d/3j/tAeNhf9eWIfoVEbHz0d79aQSSgfPK/UElEb/6x9Xy4mMI8utv/qjw
JDtRnF/9utmEYPPLAEwTjnkEeb4fDukhyEGM4abjmmyc38mtP0nWULg6WgRYzwiEw35rkBFJJvjK
OC8WkheX/uTewplfhXFKkGX4L+Me8dIHBHqtMzB3WhxYuaAxoIgVZYU/Rtfz1+LqPHAtxaaEEDi6
uDibBvsFqcxheekPpQQBPVr5VXbBIAS88G+pBfplugV+mgAGTkqyaKtoHYslKwLxYYtBRE79Dmig
wadpnESQN7DKFELGlMqorMQkFbDbXPoLSi1KxBZBIgWrA0xoqVGby99CytzAr4JwthJcsVUtoo+B
+4jJmlV5zWNFIaqUrjPr5C/L600m6ogTO7R2MMoJDK1YJRGwoHB0vDXhYwPtJk/LG8oWSyN47esb
IOWRgFQBbFeTF1jZBs+ZAi8GKVGtPYcZQ+nqS062XQxdp4lRdos4R7dn1KxiuoaRKyNGjSGdtUca
K4s5nqdgoxeUVVlyobAog8UyI7hJctIWoGO+pAJky4YVvBgD9IIRh9SHz6+c4VxaZcTC4bWvXUmC
9I3YtBmoiRkPw24G3iF6RDePJW8rXIFUOcLYrkgY8WU3iNBoVotjZSdAuq6IzAOLDpQDCAHKZczq
hZpfbTYb/PeZc0qyBPEwKN6QEqNznUI74gApx+WFMz07BxkEWWvy/no+Cb6e9/UmfzSiiw0w7/Ki
FueBA+zgF+7Rd4C5X+FbjPmVQ9qLETAaBkZ4lYKuSeK3iggW+a9nZ353Z+zisv5Yp5SoSlC/ZzV3
7Ef1ycgtXqQtP/j6Y537NPhiGgx8TyOcAM/DYH1z0+AJ5vSd+cHNhflhzW2ZAbctvGPJNOxjO2ay
pQgkHErbGEHX1xfeW7q8iMBuN88qAWWfX/lQcMUTVJbgp8D70/qGqHjZ5xNmtnj852U/pISajJWk
YKaD1aH6auVLrAb4+XwV+WfO/VP1W4MuN95CBMNFAg7r/HwwQsA7eDY0KK7PwY07ABzDaywFTanS
rz8GpDP/SZWXtcoih2BadgdpTwMXArBqPNiYuTGhXNUyL0eDVq6pfbXMvUVk89J7xIBQ6JKW+VDj
MJKWJE0Dc9cl1nCxQmzF/zhzAE2kVrk/DG9vx2eY2nmjm4ztw8U6uMS3EwmZhtI4XABuLHib5Vo2
EW+8x5ywnO30gJNBKoJt2Fia8CBqXeWtM+HTdf0EsmZBEPUQxejEOQciWdJ6zbMxAFRSXn8yHqMg
PMxpHthNf8ktWkAEpqH9oYaEz7gRP7yU5/OArcqlYX91oJhmRAEzEM64YZYRffmqZzf+2pmlhPAD
AtAJRlGeJ8HBbVrrFAK3iTdlJQPInwRDjM+qsVn5MrGaufifnJTWXd/WF/4kHyBXn3xncluft07M
GAmksUj+oz8+0SB/4NMsEZx2fnbhaw6wTo4I9FfWC+nt9fnQ2dJYv6XAF0ir8Es31J++xYLIpbbw
vrVpjPXFkbXjEIakJYQLLWOeqVgD5YYhxR4SxYo6Ua71B7NFyhJCcuC8gdqLYRXfRAjbUMjF3okZ
50nGCgp5H8/fhwlI2MIDtMNm2qCJMaThKuzCrw4eurmYCSbU40qxDrXSFc0xrFw0zUQZqHAmIUTS
sUn09jp7fsGY63X2A+QxP83KOI8Z+WlGIZj6aab/T8U/GrVsSHwSwbDtB2gtSGykx3leOfYmBy2r
RdGYVth0MSitD042xjupjdBVrU/QsdAscuzTxcfLgT0MhdoMtT/sd5+GUT1O2lecPtwrn//eH2aP
u6fdt/3j/unYUTQzstKp0LTrB6daUoMyJWDF5rGoWxYD6GZ+3s/vO+MAxr487N2kEBspQo/97QRz
ZERe00vvD49/7w77WXK4/6t59ugXSZnIdVgMPgduyKszC84XIJcdqkdXaMpqSkS2jYd2ArX/dtjN
vnZrf9Frmw/dAYQOPOLaeidarQ1/DT9Avsx3NhzpI10m1Baf6TE+xKcGRWND7Tpy9Vp3d+iCCePW
ayxWsCrsC+weLoZVrh8tJvD2leW1++H1refgemiy1W+85ov7ANOvUDEvzzw+c40NZvg6P3Cih+Bn
z0OD0zSGNWWS1jCM3s26V5Xd4e7P+yPkem+H/c9f9i9wJ7aiWJ7Gfo/VB8qbJx37KJrSl1fGfsd0
JCMR9b1hjmpm2qKgN+o8UGR302kWGHCFRgdv3L1ul2AzKqjyAqzXaD2iGdB2fMn5ygFiEQ1+K7ao
eOVpzsIoDBW77S1ztoVxcVXotEr3weRW4U+jNBkuT9Pa3Rj2ueY8aVs+3X0IuoBwo0gaN4T9R7oN
qXR3177pmkNx5u5SczJcm8PiDSmU7jcpicCX07Y11UOijUfAvGRWnTY0rmfqDbSqzM10pOnqtcFd
15jpgz1znUlSCW4mk80xwLWCdddXv2IjsKcLzMGAy2m3XdIY30IN38yTKqNSyzXGR8IuX7Tk6Qav
vmiaK5Fjj/jo2frplt26ijl26g6CXsArmfasT+P77npeFS8TflM0EzKy5ZUrp2DMtu0itTK7HuIM
vX4E+wJXkxiApvCDh2sgN6FEow4tyEiXUn0HugMk1G7QtGI2vdeiXjobxpsAv2iZkeHtEqv9xhu+
HBvTmK9//mP3uv8y+28TJL4cnr/ePzR9hYN7BbS2XOV19VNk+pgvqxbY/gp2Po6vP3z7178+jJ/K
Txj1jpZQdY59MaYZ1M0jEtsfjKy8kVcrttdDbTkLQ2VfXN3gVAXCg5MbsD+EH+xbCI50pIj7zvdA
Z0uHGWgdbMEoHgIM5RQONkDcgLeWElR+6MWrWa5zPH9fTQHyBbZ4m0c886MowfIOb4VdPMHzlE2j
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
--===============4412389424490352959==--

