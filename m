Content-Type: multipart/mixed; boundary="===============6235160890857699019=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 4258/6218] drivers/gpu/drm/i915/i915_drv.o: warning: objtool: __llvm_gcov_writeout()+0x14: call without frame pointer save/setup
Date: Mon, 04 May 2020 10:40:35 -0700
Message-ID: <CAKwvOdniUJj+RTiD886=TA4gC8g0iZ16phRSDK=vLcZfTUa_RA@mail.gmail.com>
In-Reply-To: <202005041106.4EO0eLIB%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6235160890857699019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2020 at 7:01 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb9d670f57e3f6478602328bbbf71138be06ca4f
> commit: 9f4069b055d1508c833115df7493b6e0001e5c9b [4258/6218] drm/i915: re=
-disable -Wframe-address
> config: x86_64-randconfig-d001-20200502 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 45b7=
d44ecb01780e26dc8d3c30bc34e32c08dd70)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 9f4069b055d1508c833115df7493b6e0001e5c9b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpu/drm/i915/i915_drv.o: warning: objtool: __llvm_gcov_writeou=
t()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_drv.o: warning: objtool: __llvm_gcov_flush()=
+0x0: call without frame pointer save/setup

Known Issue: https://github.com/ClangBuiltLinux/linux/issues/955
please ignore, sorry for the noise

> --
> >> drivers/gpu/drm/i915/i915_getparam.o: warning: objtool: __llvm_gcov_wr=
iteout()+0x13: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_getparam.o: warning: objtool: __llvm_gcov_fl=
ush()+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_pci.o: warning: objtool: __llvm_gcov_writeou=
t()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_pci.o: warning: objtool: __llvm_gcov_flush()=
+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_params.o: warning: objtool: __llvm_gcov_writ=
eout()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_params.o: warning: objtool: __llvm_gcov_flus=
h()+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_irq.o: warning: objtool: __llvm_gcov_writeou=
t()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_irq.o: warning: objtool: __llvm_gcov_flush()=
+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_scatterlist.o: warning: objtool: __llvm_gcov=
_writeout()+0x13: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_scatterlist.o: warning: objtool: __llvm_gcov=
_flush()+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_suspend.o: warning: objtool: __llvm_gcov_wri=
teout()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_suspend.o: warning: objtool: __llvm_gcov_flu=
sh()+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_sysfs.o: warning: objtool: __llvm_gcov_write=
out()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_sysfs.o: warning: objtool: __llvm_gcov_flush=
()+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_switcheroo.o: warning: objtool: __llvm_gcov_=
writeout()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_switcheroo.o: warning: objtool: __llvm_gcov_=
flush()+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/i915_utils.o: warning: objtool: __llvm_gcov_write=
out()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/i915_utils.o: warning: objtool: __llvm_gcov_flush=
()+0x0: call without frame pointer save/setup
> --
> >> drivers/gpu/drm/i915/intel_device_info.o: warning: objtool: __llvm_gco=
v_writeout()+0x14: call without frame pointer save/setup
> >> drivers/gpu/drm/i915/intel_device_info.o: warning: objtool: __llvm_gco=
v_flush()+0x0: call without frame pointer save/setup
> ..
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Thanks,
~Nick Desaulniers
--===============6235160890857699019==--

