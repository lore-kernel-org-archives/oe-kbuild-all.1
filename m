Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5762D6E6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761888366; cv=none; b=LBDC6cZj8mDM7/QFVF5BnBtOGa9rWXj/2ASkq/hYVLAEM9DuD7RUhscpSXirN740fxgNgrMfFVFfBDVXGVKpsiev8rvN0n9doWe8TnHV0hDfZIShg/kxztmSdIDviS2Y8wcczliEqD4d3M00/s9cDMxcaphaLBxcIUIpspeHfXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761888366; c=relaxed/simple;
	bh=sMxXPrW+6JuiJPVF7BDv9T9xRLe9e0WrVuR1A1ODGSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CyzFWz1md0PisrlQGfi9IdZBRZW8jpO736NLnVpCFPEzVUf/ADGhayqrod3e6Y8eMdqnAGobFyorSAhfeRPbHp1xWWwNNjPSMGlfH8isGq1Mh6TAVnrAc9qU34PXvwrcjB2XlJD4fm6EmCocsGFRWZ+cMfq2xhfrIC5jEdY76AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLwAGQk9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLwAGQk9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so17070215e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 22:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761888363; x=1762493163; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBbdaqSwc4AIhUshtjXjzk4g57EzDgumS+pQDOnoPmc=;
        b=xLwAGQk9Q4HTPsM1YYWIMi8RTHTiagGYZqJ5jYj8mDTbW11A25wH5OiPvF8iVfJgpd
         PXALi9wYXOsfGJegFuZEuuAr5QQHi70YLVagB5whbDyNyLEdjrFXNkL58OD8N1DEdV3Y
         s16Rl3BLMtBV6f3zrN4Ui2VIBTNJjBDk6DX7ZwR+BGsSPfcOQj9KuXcURe7KVP9b3PpL
         uK2WvQFpLHfbdWmxSMB3yuWD0VWlKC1XwGOzn2Xn5b8+eZVgnFuxmftLK3J9/5LHb5fm
         4HZvo71Xka2IssswseB8WTIoCzuR9+t2Eq5L7ldxJy2INOQ/jwTu47/jSoAD3ph7sJbc
         Th7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761888363; x=1762493163;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBbdaqSwc4AIhUshtjXjzk4g57EzDgumS+pQDOnoPmc=;
        b=rbrfnTzCyVT1UHtCh7X29/yNbveL9Mhx9hCOml8glS3xN9ycmBH96Q3/2icCkj7VTp
         vyceRZl7/+YAXjL5PWvC8iZBrxrd1XLXlL48CLFmyzcwEWtDxUHxGizdceiEhCbUahv7
         d64ByLoLvNwkdBWtqCXXDIM/uWSrFDYYjkxTdUmwgmHrAX5gMqGxQJ1dV3f6sd92rx7j
         +0DOvDddFhHhQPirM8bk16KZyAcP3JN7f/+xMer5mWHwG0S1KP5CyqdOIiQ0RGox9tNG
         my5lOMLOKy3Ec2Z3oR2i8mbPcUld4ApFwlYR6jSRQXlC2duhsdI1nG+vLNwBswVn9aEP
         9Cqg==
X-Forwarded-Encrypted: i=1; AJvYcCUGVavmDTeG8lIKoWdKyRNHEUreGIW0jDkE4iaZhmeX64gUpz6oRg67A0ny4khka/tAY15VDJtvnn8isya7@lists.linux.dev
X-Gm-Message-State: AOJu0YxL/H7henlEwmG1mcpAJePX3Sw5RD6gL2I6BsQoTF3JTx5nqrSj
	xqzZPdnaxP4YccC8R7c18Wqr1NubOc+cETtneVDGE8lI5twIUnyudNPZmyXRkkKGFLk=
X-Gm-Gg: ASbGncu5jsFAR/5ngTTeQT+1ipnO49kowkk5YJQcrJrjZGQej+uqaZVMG0n1haVzxst
	0hcTfw4uHRUd0xmegV64VzY6GuUU9L6rn+FX6fCDZELADo/OJmqASlqVrSJcZ/NTZsR0JhCU7c6
	SwjYY7O8M1m0GUT3k/4gGppugy6rWAbt+Rqe8D5y1ildvW3ZKUO9/1WiNMUnPWSYMC1SKRjvlBm
	0jja/2PNyMj7HIcNNwiquk1QEYyjXHHFbtnijkcwYTz4a13A30l2lXgqJtWBMoVPiELYc3OJ1go
	GSytDdGnbw6drAycG+geLmNkgLAFyDVas/428Ll1i0twI7mf/l+K+TpekDWYjEvaZTOcBk1uLyA
	aHBWcuaflssOHA6itLxWKy//obFE34sdj0P7zhRhDZOAba0yOCl4GUftxltY2TJBQ7DVZh9WnzT
	AgCx5rHgtWgterGu5w5/JTX3VWMEk=
X-Google-Smtp-Source: AGHT+IGYPrIiVaisNFjIbu09Y2ei9vHAYdZPa5ge2OEhniwhNmm0v/eYM1ZitJu75RTNt35/IRGQ4A==
X-Received: by 2002:a05:6000:2403:b0:429:8d0f:eb6 with SMTP id ffacd0b85a97d-429b4c68b8cmr4432844f8f.15.1761888363164;
        Thu, 30 Oct 2025 22:26:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c10ff4f6sm1662636f8f.4.2025.10.30.22.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 22:26:02 -0700 (PDT)
Date: Fri, 31 Oct 2025 08:25:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Omar Sandoval <osandov@fb.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Omar Sandoval <osandov@osandov.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [osandov:svm-int3-fix 1/1] arch/x86/kvm/svm/svm.c:321
 svm_update_soft_interrupt_rip() warn: right shifting more than type allows 8
 vs 16
Message-ID: <202510310909.y5ClH2qW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/osandov/linux.git svm-int3-fix
head:   71cc6a9d4228c085a380dec917c65df5fcd9e8a9
commit: 71cc6a9d4228c085a380dec917c65df5fcd9e8a9 [1/1] KVM: SVM: Don't skip unrelated instruction if INT3/INTO is replaced
config: i386-randconfig-141-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310909.y5ClH2qW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510310909.y5ClH2qW-lkp@intel.com/

smatch warnings:
arch/x86/kvm/svm/svm.c:321 svm_update_soft_interrupt_rip() warn: right shifting more than type allows 8 vs 16

vim +321 arch/x86/kvm/svm/svm.c

71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29  318  static int svm_update_soft_interrupt_rip(struct kvm_vcpu *vcpu, u8 vector)
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  319  {
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29  320  	const int emul_type = EMULTYPE_SKIP | EMULTYPE_SKIP_SOFT_INT |
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29 @321  			      EMULTYPE_GET_SOFT_INT_VECTOR(vector);

vector is a u8 but EMULTYPE_GET_SOFT_INT_VECTOR() is:
define EMULTYPE_GET_SOFT_INT_VECTOR(e)	(((e) >> 16) & 0xff)
so something is mixed up.

63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  322  	unsigned long rip, old_rip = kvm_rip_read(vcpu);
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  323  	struct vcpu_svm *svm = to_svm(vcpu);
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  324  
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  325  	/*
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  326  	 * Due to architectural shortcomings, the CPU doesn't always provide
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  327  	 * NextRIP, e.g. if KVM intercepted an exception that occurred while

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

