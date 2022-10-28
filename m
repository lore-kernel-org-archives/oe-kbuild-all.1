Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1778F122B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Oct 2022 21:46:30 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id v28so5676166pfi.12
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Oct 2022 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jP4OklSgp2rBYG93I9xkWgmdPj5Tm2D9ixHbtE5w1tw=;
        b=GooZYJODF71P9kFJ18YDcbyyZua5fkCYPfhs35i1a4McB/mV4JLSM6iBeY9kz/8SYq
         HF8RjeTeFwZj45GGyBnaiv5g2kIFSEqdcsdRAXgEB0vTwr77u6tAcw3ISKvDmF9+9Gk2
         tw0yDyzapxC4DDuFOU+hkQfIwH97BXkebsHlL2oUkggcG5fl0/Y2N97iGSHToOl+qz0T
         dvpWlivrSfbz/lwsPqafdKtqF7Dj5AqWHq8PmUu4R7MB8WeG1R0VaKpEB3eMSp48+wBT
         ExylS2Y//uM205PxqVjuY1IqAH0LydtHog917zy5uT4iIsk/uuT1OdS9W1rQto05mxxe
         t7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jP4OklSgp2rBYG93I9xkWgmdPj5Tm2D9ixHbtE5w1tw=;
        b=FzMTaOFhm1oWgISB7iQ6t0jb8toycLBXiM4aZQjSvMXKKlNlQuVlI9VkILR85Xxt6t
         nEfPxWCo9q31TWkBAdf9HZhmOBexVyhpgbGbscvkTYWtTqVQXV0A6Rskq3rqawDPl/ML
         koczY+kHjXyQKwFGC8EMCJUHkIVx871SyDdadX13G03IpGIU5xckv8ydimh3I1vk7Gg2
         tL2DMlPssc7KHw5XYZcXA4rIRrwZC5XikgJt+iwQ4Bb4NTi6nqVJf2TLwD0A8AHHFYby
         rXwdRIk2cIPA8pcaM2rvaJ65GfezYF9bv9RLDTkp6O6AQUn0YViRXB+yj9GN/QzoQV2W
         sm+Q==
X-Gm-Message-State: ACrzQf3Txn9D6U78Js/UOKNNN/GJ7V/lLJsw2WDSqAXHOjJCnXMqRYHb
	99LM35mU74n9etsnu8oqo6Po28hgHUVUrA==
X-Google-Smtp-Source: AMsMyM7+Cns6sJyvsFXtuRTBDiU0EfQF4XhQK9UETILz8tH756VBjCacvu/len0aEysjMpr4kjo6Ow==
X-Received: by 2002:a63:80c7:0:b0:46e:c7be:b56f with SMTP id j190-20020a6380c7000000b0046ec7beb56fmr1377113pgd.382.1666993590284;
        Fri, 28 Oct 2022 14:46:30 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ecd100b00176b3d7db49sm3593804plh.0.2022.10.28.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 14:46:29 -0700 (PDT)
Date: Fri, 28 Oct 2022 21:46:26 +0000
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	mlevitsk@redhat.com
Subject: Re: [PATCH 04/10] KVM: x86: do not go through ctxt->ops when
 emulating rsm
Message-ID: <Y1xNso2nYZkSSZ0T@google.com>
References: <20221027164944.3031588-5-pbonzini@redhat.com>
 <202210281538.c5NukqBx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210281538.c5NukqBx-lkp@intel.com>

On Fri, Oct 28, 2022, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    arch/x86/kvm/smm.c: In function 'emulator_leave_smm':
> >> arch/x86/kvm/smm.c:503:33: warning: unused variable 'efer' [-Wunused-variable]
>      503 |         unsigned long cr0, cr4, efer;
>          |                                 ^~~~
> >> arch/x86/kvm/smm.c:503:28: warning: unused variable 'cr4' [-Wunused-variable]
>      503 |         unsigned long cr0, cr4, efer;
>          |                            ^~~
> 
> 
> vim +/efer +503 arch/x86/kvm/smm.c
> 
> e2881deb76e87c Paolo Bonzini 2022-10-27  499  
> e2881deb76e87c Paolo Bonzini 2022-10-27  500  int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
> e2881deb76e87c Paolo Bonzini 2022-10-27  501  {
> e2881deb76e87c Paolo Bonzini 2022-10-27  502  	struct kvm_vcpu *vcpu = ctxt->vcpu;
> e2881deb76e87c Paolo Bonzini 2022-10-27 @503  	unsigned long cr0, cr4, efer;
> e2881deb76e87c Paolo Bonzini 2022-10-27  504  	char buf[512];
> e2881deb76e87c Paolo Bonzini 2022-10-27  505  	u64 smbase;
> e2881deb76e87c Paolo Bonzini 2022-10-27  506  	int ret;
> e2881deb76e87c Paolo Bonzini 2022-10-27  507  
> 9842725ac4bb94 Paolo Bonzini 2022-10-27  508  	smbase = vcpu->arch.smbase;
> e2881deb76e87c Paolo Bonzini 2022-10-27  509  
> 9842725ac4bb94 Paolo Bonzini 2022-10-27  510  	ret = kvm_vcpu_read_guest(vcpu, smbase + 0xfe00, buf, sizeof(buf));
> 9842725ac4bb94 Paolo Bonzini 2022-10-27  511  	if (ret < 0)
> e2881deb76e87c Paolo Bonzini 2022-10-27  512  		return X86EMUL_UNHANDLEABLE;
> e2881deb76e87c Paolo Bonzini 2022-10-27  513  
> 9842725ac4bb94 Paolo Bonzini 2022-10-27  514  	if ((vcpu->arch.hflags & HF_SMM_INSIDE_NMI_MASK) == 0)
> 9842725ac4bb94 Paolo Bonzini 2022-10-27  515  		static_call(kvm_x86_set_nmi_mask)(vcpu, false);
> e2881deb76e87c Paolo Bonzini 2022-10-27  516  
> e2881deb76e87c Paolo Bonzini 2022-10-27  517  	kvm_smm_changed(vcpu, false);
> e2881deb76e87c Paolo Bonzini 2022-10-27  518  
> e2881deb76e87c Paolo Bonzini 2022-10-27  519  	/*
> e2881deb76e87c Paolo Bonzini 2022-10-27  520  	 * Get back to real mode, to prepare a safe state in which to load
> e2881deb76e87c Paolo Bonzini 2022-10-27  521  	 * CR0/CR3/CR4/EFER.  It's all a bit more complicated if the vCPU
> e2881deb76e87c Paolo Bonzini 2022-10-27  522  	 * supports long mode.
> e2881deb76e87c Paolo Bonzini 2022-10-27  523  	 */
> 9842725ac4bb94 Paolo Bonzini 2022-10-27  524  #ifdef CONFIG_X86_64
> 9842725ac4bb94 Paolo Bonzini 2022-10-27  525  	if (guest_cpuid_has(vcpu, X86_FEATURE_LM)) {

My suggestion from the previous version[*] should still work.  Copy+pasted below
for convenience, may or may not apply cleanly.

https://lore.kernel.org/all/Y0nO0quQnVFQruPM@google.com

---
 arch/x86/kvm/smm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index 41ca128478fc..740fca1cf3a3 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -500,6 +500,8 @@ static int rsm_load_state_64(struct x86_emulate_ctxt *ctxt,
 int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt->vcpu;
+	bool is_64bit_vcpu = IS_ENABLED(CONFIG_X86_64) &&
+			     guest_cpuid_has(vcpu, X86_FEATURE_LM);
 	unsigned long cr0, cr4, efer;
 	char buf[512];
 	u64 smbase;
@@ -521,8 +523,7 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 	 * CR0/CR3/CR4/EFER.  It's all a bit more complicated if the vCPU
 	 * supports long mode.
 	 */
-#ifdef CONFIG_X86_64
-	if (guest_cpuid_has(vcpu, X86_FEATURE_LM)) {
+	if (is_64bit_vcpu) {
 		struct kvm_segment cs_desc;
 
 		/* Zero CR4.PCIDE before CR0.PG.  */
@@ -536,15 +537,13 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 		cs_desc.s = cs_desc.g = cs_desc.present = 1;
 		kvm_set_segment(vcpu, &cs_desc, VCPU_SREG_CS);
 	}
-#endif
 
 	/* For the 64-bit case, this will clear EFER.LMA.  */
 	cr0 = kvm_read_cr0(vcpu);
 	if (cr0 & X86_CR0_PE)
 		kvm_set_cr0(vcpu, cr0 & ~(X86_CR0_PG | X86_CR0_PE));
 
-#ifdef CONFIG_X86_64
-	if (guest_cpuid_has(vcpu, X86_FEATURE_LM)) {
+	if (is_64bit_vcpu) {
 		/* Clear CR4.PAE before clearing EFER.LME. */
 		cr4 = kvm_read_cr4(vcpu);
 		if (cr4 & X86_CR4_PAE)
@@ -554,7 +553,6 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 		efer = 0;
 		kvm_set_msr(vcpu, MSR_EFER, efer);
 	}
-#endif
 
 	/*
 	 * Give leave_smm() a chance to make ISA-specific changes to the vCPU
@@ -565,7 +563,7 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 		return X86EMUL_UNHANDLEABLE;
 
 #ifdef CONFIG_X86_64
-	if (guest_cpuid_has(vcpu, X86_FEATURE_LM))
+	if (is_64bit_vcpu)
 		return rsm_load_state_64(ctxt, buf);
 	else
 #endif

base-commit: 8b86d27cc60a150252b04989de818ad4ec85f899
-- 
