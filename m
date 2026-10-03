Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447CF381E8B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 04:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002517; cv=pass; b=DtYmWIGNbeHIg/8xb97q8r3IZg0hO/Uw4+fKgPhdveOF/k5+iyUU+8v1FkTs+l6iWgd9gZC9kgucqkDLha4M9xb4QoeMxGfDdWelhRaH83HnHjUABWdXcUB+imIRq7miuT49qku22DMwAsWHjwZjdbVJmi+siNGPmuuOc/JUYnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002517; c=relaxed/simple;
	bh=9HV8ivjSIVJPXUEW8t/GvnA+QnJCmpwHY5r/HcMLJz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMS4XkgbTFg3oHaOmugX/AB4fITMnbOFAw3pfluYw5EU1T69L5tS8o1kGGUr7TPgrdFXeqEMsanB+iVfuJgkg7008VT5UdQMPgCF6OjQRQfDx0eezFVQTTUHIf+NM4dCpsBAU5atqVYuKre2BGCOCEKO6MqcoD5Fjs8IIsyhEs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=pWV6daJ5; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="pWV6daJ5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a09e2d0f7dso2460195e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 02 Oct 2026 21:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791002512; cv=none;
        d=google.com; s=arc-20260327;
        b=gkBQuJJI/okdoehmLdUB8DJcpPSMUbUG18kilmjMLEZKZs2z9ZVojeicvvHLAKoukx
         eVJqUTvSFJXRXZoOwfNSZX01NbhuqVIJEb/9dmIrmMVHoGtGhrFGvN43Q/Xk3pMWgmlb
         XonZP2nTzY1a+8pGrcIek0rUujEi3w5quVCGGxRZbR6w/hiu7APwFx14iCqrPEgE/MQH
         WmQFibpnh7Df/wAVkKxlKQhEGyaBP6CqHYgrDB1ne0Ewk/r2sjholY0HDeBT9sGHdFk8
         0deor68MBNhJY9pIETwX6uWZp/AxhLfMNnKMOxRHFmeb/uQ/zDXTEbL3mjvnS9s7DX7/
         df+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7TeWG7eBfwN9fqcBz2YTPOJ+uEK88CVw5+xe0Jks6Y0=;
        fh=UonMDG4GfNEMRoZo5piO67HFjCZXd5cAoJu9nB84+DE=;
        b=l5EalgbaKOIhOghLSdVQ0YhDx4/BRRzzadvfEnP8tX/XFyXQzhccmJxxluTblMGw/S
         AjZaBVIm3q1P1wNK4wEuykNavcg/+FRjqLokL7FfRYyVQPq53/wm4xL3NGLwe83b8bec
         nmFUDeWiKmtFR4551+fwcT9hDrsu4eUpS/a4Hb4ubK7ajtxslf6Jifk9SPBxe4WiRGfo
         dyxSzq3MucVGNwoO1j8ExU7sHMYt6MxZ3co6TFy9HpphmjKK/0OYASt231aUlCOPEoJY
         mj3scjEJT+AQtnxW8pLwg2JgIMvEts8ZQLHx5SJ7KLM2ReYfyI5E6nY3Xxbphi/SmKGc
         FBKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791002512; x=1791607312; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7TeWG7eBfwN9fqcBz2YTPOJ+uEK88CVw5+xe0Jks6Y0=;
        b=pWV6daJ5dy79e3Jge+u6gYxDpjPz8UKR/UhpwUDgv8F/3VGjfDRy2R/TgKczav0QmO
         IuoWIo9Mx9wWFbmx7Y0BmsggPTkHiTanp5xBvgix5CwZXYA42s5lTOthagioqrI2hqa6
         VQUAlwcIQVF9ESu86KmUVi0WgdUBtAZk5MdRW+/8SD+0SJKdUzWXtjQQzWATHs09Zd68
         QxPx0ei0f0pRdG81IXn89e960E0nziPxEeZauV+U2f3685rnRzEZcZTiYT+dH6oXQDli
         824R+71lLn9otjZ6fupFbnPHeqh1jjf5bnDfg7einfRLFtP1VLEHzNHNp7GpxgpN9nnA
         yKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791002512; x=1791607312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7TeWG7eBfwN9fqcBz2YTPOJ+uEK88CVw5+xe0Jks6Y0=;
        b=GQAt4r7kwJZGayYHbRboWGIuaIDwGymD/7qkTs8t8eDSlpieEStGKgCGCpoTnqNV05
         km8GkbFZ2wwdSyxuYs6B23+akYl8NJVDNJQMjqOB+DVgB8i4Xp1xIZQ6CuCAVmNiVp4P
         +MWAxgNcyYL0LNqo41cRlrPKjcXW0eyASRo+EuHCS8v+X/gSUgZHNti9TvBDmRgS6CgA
         rB4C1hLXjvGqOb/IRMq0jIlcNWHUlcsvzlt+aEoDMVpZDPt0pLaHoYhTCGMbPzHMzO/R
         281uv4fY/egjnxAl9kG2p0EZJOReDgf2/JK/usaauKwYkLEB0TU/f7n1cT07gyPTKXNS
         iXYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlJDybpMeFWcotq1l0K2tFQwW9DP0JX7bBnf8X3rNQdULRM82ggwmKgiY3VpFZwh8qHO//LrjOa3NbvaEq@lists.linux.dev
X-Gm-Message-State: AFuF++k+RYq+Szj+uo0jzgYXLXtXXEi9q6KQgpojZztkD2FQqnEGuo2d
	dfRXz2xkFJn6IX7I6+pYiaKWyo6aMOzXvtzE9vixpJ+qoco1Lut3fztiqf8vdOq8jOEOz1oV2dH
	1l5wR75+bYDONZCw0izYUvc2Bp53PPCsOzlw6ub1CPg==
X-Gm-Gg: AYBFou0dm8ixL3Ic5X7wkwSrguBYpxklKlPEofb8KWiPUE+4R46+YfT3tD/anJ3zwT4
	luAh2QhiuT85XFuor3ZjdNt2GzfZGlcqINM+C9J//bFaSbWrKq7ud8Qc2klM4pwqmbPLEJuSs5t
	17E9tJVj9vNkuiGTlqVmIxmYJvqB93Lw1mvg/+3mBjuDvOm0jkUE/RgKFePkG7WmMIBjLHQ1whd
	FD3jPTgLPejAPvTKZyLLQTXFYsk0RJPwpJJ9PPDk/kZDZFAAAiWUEwACz+eV0h3Yhi/qMPOUK9h
	KVIVtAYC6RKg9QGOVSjezs10kp2O9iXxRiknR9+M4ybeRorlCs9SH6BwydqtWClJ76QJh59Su7m
	8z9oINm7D1hU+Pw6MLVJ/w7LBaY8f+WMwnXyIN9xHxcCHibB8hnQ9C2y8R8iICWO0oL3imDDZo/
	s=
X-Received: by 2002:a05:600c:3510:b0:499:9240:9a1c with SMTP id
 5b1f17b1804b1-4a027559c6fmr81635275e9.15.1791002512235; Fri, 02 Oct 2026
 21:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805065132.3210346-1-yhchen312@gmail.com>
In-Reply-To: <20260805065132.3210346-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 10:11:40 +0530
X-Gm-Features: AclHuK_IXoPpwMtGcEHrcY1efUXEIKHZ22esp61Xf_4MLGY4isIRd8O8F7q5fHw
Message-ID: <CAAhSdy2v1zL2e3o4m5ofkvby1N6hWLLVUirmz1_kY5+uoj=oWw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
 VS-mode WFI trapping
To: "Yuhang.Chen" <yhchen312@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Quan Zhou <zhouquan@iscas.ac.cn>, kernel test robot <lkp@intel.com>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 12:22=E2=80=AFPM Yuhang.Chen <yhchen312@gmail.com> w=
rote:
>
> Add a kernel command-line option, kvm-riscv.wfi_trap_policy=3Dtrap|auto,
> that controls whether a WFI executed by a VS-mode guest traps into KVM
> (HS-mode) or executes natively.
>
> HSTATUS.VTW governs VS-mode WFI: when set, the WFI traps into KVM, which
> blocks the vCPU through kvm_vcpu_halt() and releases the CPU to other
> runnable tasks; when clear, the guest runs WFI natively. Because RISC-V
> WFI is only a hint (it may be a no-op on some implementations), the
> policy is re-evaluated before each guest entry rather than fixed once
> at reset.
>
>   trap  : always trap VS-mode WFI into KVM (HSTATUS.VTW=3D1). This is the
>           default and preserves the previous unconditional behavior.
>
>   auto  : clear HSTATUS.VTW so the guest runs WFI natively only when the
>           vCPU is the sole runnable task on the current CPU; otherwise
>           keep trapping. When the vCPU is alone, skipping the
>           virtual-instruction exit cannot starve another task, and on
>           hardware that honors WFI the hart blocks until a VS-mode
>           interrupt. The policy is re-evaluated before every guest entry,
>           so when another task becomes runnable the next entry traps
>           again and KVM blocks the vCPU through kvm_vcpu_halt(), yielding
>           the CPU. The vCPU therefore never monopolizes the CPU the way
>           an unconditional native WFI would: it either blocks through
>           kvm_vcpu_halt(), or runs WFI natively only when no other task
>           needs the CPU.
>
> Measured on QEMU TCG (-smp 1, -cpu max): wfi_exit_stat delta and guest
> wake count over a 3 s window. "busy" adds a CPU-bound competitor that
> shares the vCPU's CPU so that single_task_running() reports false:
>
>   policy  busy  exits  wakes   cpu%  note
>   ------  ----  -----  -----   ----  ------------------------
>   trap    off    286    285    6.5   default; no regression
>   trap    on     291    290  101.0   trap is unconditional
>   auto    off      4    287    5.0   sole task: native WFI
>   auto    on     285    284  101.5   competitor -> traps
>
> With "auto", WFI exits drop to ~0 when the vCPU is the only runnable
> task, and rise back to the trap level as soon as a competitor appears,
> which is the desired dynamic behavior. Host CPU stays low in the
> sole-task case; the ~101% in the busy cases is the forked competitor,
> not the vCPU.
>
> Assisted-by: YuanSheng:deepseek-v4-pro
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Yuhang.Chen <yhchen312@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608051354.KYOXP5po-lkp@i=
ntel.com/
>
> ---
> Changes in v3:
>
> - Guard the early_param() parser with #ifndef MODULE. RISC-V KVM is
>   tristate and may be built as a module (CONFIG_KVM=3Dm), but
>   early_param() is only defined for built-in code, so v2 failed to
>   compile as a module. With CONFIG_KVM=3Dm the policy now keeps its
>   default (trap) value, which is safe and regression-free; the rest of
>   the policy logic is unaffected. The kernel-parameters.txt entry now
>   documents that the option is only honored when KVM is built in.
>
> - Re-evaluate the WFI trap policy before each guest entry instead of
>   only in kvm_arch_vcpu_load(). In v2 the policy was checked once when
>   the vCPU was loaded, so between two kvm_arch_vcpu_load() calls
>   HSTATUS.VTW could go stale: if a task of lower or equal priority woke
>   on the vCPU's CPU while the guest was running, the run loop would
>   re-enter the guest without re-checking and without preempting, and a
>   native WFI could then halt the hart and delay the woken task until the
>   next timer tick. Checking before every entry closes this window,
>   because a wakeup arrives through a host interrupt that forces a VM
>   exit, and the next entry re-evaluates and traps.
>
> Changes in v2:
>
> - Drop the "notrap" mode, which cleared HSTATUS.VTW unconditionally and
>   so never trapped: the vCPU never reached kvm_vcpu_halt() and could
>   stay busy even while idle.
> - Add the "auto" mode, which clears HSTATUS.VTW only when the vCPU is
>   the sole runnable task (single_task_running()) and otherwise traps.
>   The policy is applied dynamically from kvm_arch_vcpu_load() instead of
>   once at reset, so a vCPU that stops being the sole runnable task
>   switches back to trapping.
> - Update the kernel-parameters.txt entry for trap/auto.
>
> v1: https://lore.kernel.org/all/20260709115610.287420-1-yhchen312@gmail.c=
om/
> v2: https://lore.kernel.org/all/20260804024707.2400404-1-yhchen312@gmail.=
com/
> ---
>  .../admin-guide/kernel-parameters.txt         | 20 ++++++
>  arch/riscv/kvm/vcpu.c                         | 72 +++++++++++++++++++
>  2 files changed, 92 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..2ab9eb335e60 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3254,6 +3254,26 @@ Kernel parameters
>
>                         notrap: clear WFI instruction trap
>
> +       kvm-riscv.wfi_trap_policy=3D
> +                       [KVM,RISCV] Control when to set the WFI instructi=
on
> +                       trap (HSTATUS.VTW) for KVM VMs. The policy is
> +                       re-evaluated before each guest entry, not only at
> +                       reset, since RISC-V WFI is only a hint.
> +
> +                       trap: always trap VS-mode WFI into KVM (HSTATUS.V=
TW=3D1)
> +
> +                       auto: trap unless the vCPU is the only runnable t=
ask on
> +                               the current CPU, in which case clear the =
trap
> +                               (HSTATUS.VTW=3D0) and let the guest execu=
te WFI
> +                               natively
> +
> +                       Defaults to trap, preserving the previous uncondi=
tional
> +                       behavior.
> +
> +                       Only honored when KVM is built into the kernel
> +                       (CONFIG_KVM=3Dy); as a module (CONFIG_KVM=3Dm) th=
e policy
> +                       stays at its default (trap).
> +
>         kvm_cma_resv_ratio=3Dn [PPC,EARLY]
>                         Reserves given percentage from system memory area=
 for
>                         contiguous memory allocation for KVM hash pagetab=
le
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index cf6e231e76e2..8efeb74699cc 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -12,8 +12,10 @@
>  #include <linux/kdebug.h>
>  #include <linux/module.h>
>  #include <linux/percpu.h>
> +#include <linux/string.h>
>  #include <linux/vmalloc.h>
>  #include <linux/sched/signal.h>
> +#include <linux/sched/stat.h>
>  #include <linux/fs.h>
>  #include <linux/kvm_host.h>
>  #include <asm/cacheflush.h>
> @@ -26,6 +28,67 @@
>
>  static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
>
> +/*
> + * WFI trap policy for VS-mode guests, controllable through the
> + * kvm-riscv.wfi_trap_policy=3D kernel command-line option.
> + */
> +enum kvm_riscv_wfi_trap_policy {
> +       KVM_RISCV_WFI_TRAP,     /* Always trap VS-mode WFI into KVM */
> +       KVM_RISCV_WFI_AUTO,     /* Trap unless the vCPU is the only runna=
ble task */
> +};
> +
> +static enum kvm_riscv_wfi_trap_policy kvm_riscv_wfi_trap_policy __read_m=
ostly =3D
> +       KVM_RISCV_WFI_TRAP;
> +
> +/*
> + * RISC-V KVM is tristate and may be built as a module, but early_param(=
) is
> + * only defined for built-in code (see <linux/init.h>). Guard the comman=
d-line
> + * parser accordingly: when CONFIG_KVM=3Dm the policy simply keeps its d=
efault
> + * (trap) value, which is the safe, regression-free behavior.
> + */
> +#ifndef MODULE
> +static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
> +{
> +       if (!arg)
> +               return -EINVAL;
> +
> +       if (strcmp(arg, "trap") =3D=3D 0) {
> +               kvm_riscv_wfi_trap_policy =3D KVM_RISCV_WFI_TRAP;
> +               return 0;
> +       }
> +
> +       if (strcmp(arg, "auto") =3D=3D 0) {
> +               kvm_riscv_wfi_trap_policy =3D KVM_RISCV_WFI_AUTO;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy=
_cfg);

FYI, module parameters can also be passed as kernel parameter when the
module is built-in. There is no reason why WFI trap-policy will not work as=
 when
KVM RISC-V is a plugabble module.

Convert this to module_param.

> +#endif
> +
> +static bool kvm_riscv_vcpu_wfi_should_trap(struct kvm_vcpu *vcpu)
> +{
> +       switch (kvm_riscv_wfi_trap_policy) {
> +       case KVM_RISCV_WFI_AUTO:
> +               /* Native WFI only when the vCPU is the sole runnable tas=
k. */
> +               return !single_task_running();
> +       case KVM_RISCV_WFI_TRAP:
> +       default:
> +               return true;
> +       }
> +}
> +
> +static void kvm_riscv_vcpu_update_wfi_trap(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm_cpu_context *cntx =3D &vcpu->arch.guest_context;
> +
> +       if (kvm_riscv_vcpu_wfi_should_trap(vcpu))
> +               cntx->hstatus |=3D HSTATUS_VTW;
> +       else
> +               cntx->hstatus &=3D ~HSTATUS_VTW;
> +}
> +
>  const struct kvm_stats_desc kvm_vcpu_stats_desc[] =3D {
>         KVM_GENERIC_VCPU_STATS(),
>         STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
> @@ -73,6 +136,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vc=
pu *vcpu,
>         /* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
>         cntx->sstatus =3D SR_SPP | SR_SPIE;
>
> +       /* Trap VS-mode WFI by default; the run loop reapplies the policy=
 before each entry. */
>         cntx->hstatus |=3D HSTATUS_VTW;
>         cntx->hstatus |=3D HSTATUS_SPVP;
>         cntx->hstatus |=3D HSTATUS_SPV;
> @@ -936,6 +1000,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  */
>                 kvm_riscv_local_tlb_sanitize(vcpu);
>
> +               /*
> +                * Re-evaluate the WFI trap policy for this entry so that
> +                * HSTATUS.VTW tracks the current runnable-task count and
> +                * cannot go stale across guest entries (which would let =
a
> +                * native WFI halt the CPU while another task is runnable=
).
> +                */
> +               kvm_riscv_vcpu_update_wfi_trap(vcpu);
> +
>                 trace_kvm_entry(vcpu);
>
>                 guest_timing_enter_irqoff();
> --
> 2.34.1
>

Regards,
Anup
