Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B55E30F926
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760605238; cv=none; b=n5tC0qKpGfOzFKQytp5pMWdaZO57HV2RY/HPkk3yKFRVXUajBFMU+pXIU+iLhlEkED61xPz8rWEnnlqXeigWlNLaKCcyjvZ9Kxwe1RuDiYOHs1/LrM29BepajovuVWzOjGi+xe6uQEpsCraOBzxb1GJ1bKCnKEv6MoGnResUhRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760605238; c=relaxed/simple;
	bh=FdenBHU5rcBSRQSKAfzbSTso6YQNkURXfQxyZlaIGC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qG+deiXdp1QXjLoljj2u3imLZF+To6oqe59Mh4RbUa4qHxHBRjuYMSsjrPnjEDiUM0auuimw9fqcqXSBivhsYtjMpCFioj1kbxaQc+JcNG0WEHQ07TCpZm5qU7Wds/+AGBrqFT/W40dXmVucBNnyfl1FFiBxKsGhvpE3TVVVOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eW2/ewSx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eW2/ewSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760605238; x=1792141238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FdenBHU5rcBSRQSKAfzbSTso6YQNkURXfQxyZlaIGC8=;
  b=eW2/ewSxHcfE8vBVkfmmR0QpVglV+d2TX0yCdYvrJZPy9X7ZDN6sJ9Nu
   BUdtrAW69Fcx1fKqBp74mTQgU+isItjXl2pdcQxJtMi1rdOgzQhTWcMAx
   PbgKXVerThwSMZi9SzCQGYR6V4E3yqo1pj8vGayX6anz4t5FRXmktck2F
   q9RV6DxWz0SBTx+LqF2Uo+nxvIFsRgomlFeAwICZlm4JTLuq9K+cIZ4Ns
   0DkbSNQyPbBPS+ORW2L33LOuGdRybEbBzMHoxfWpBCYC6g1vVbWiOViZC
   KnGYkPzQpMtQjEi7N20kxjLMhibg2PzjQuzQl/t3WiSY1p1+KQKJSpeGn
   Q==;
X-CSE-ConnectionGUID: FQ6rm8i8R+C8P/+hEhCcxA==
X-CSE-MsgGUID: 5jpapy4gRWqgTr0H+qmrTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62886216"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62886216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 02:00:37 -0700
X-CSE-ConnectionGUID: Y67/g9b4Rt6HcpsjfqA+wA==
X-CSE-MsgGUID: ufcDctIQT++VpEwHe1YDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="183200149"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2025 02:00:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9JqZ-0004cD-36;
	Thu, 16 Oct 2025 09:00:31 +0000
Date: Thu, 16 Oct 2025 16:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Subject: Re: [PATCH v2] KVM: x86: Unify L1TF flushing under per-CPU variable
Message-ID: <202510161649.QbfhDLy3-lkp@intel.com>
References: <20251015-b4-l1tf-percpu-v2-1-6d7a8d3d40e9@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-b4-l1tf-percpu-v2-1-6d7a8d3d40e9@google.com>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6b36119b94d0b2bb8cea9d512017efafd461d6ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/KVM-x86-Unify-L1TF-flushing-under-per-CPU-variable/20251016-011539
base:   6b36119b94d0b2bb8cea9d512017efafd461d6ac
patch link:    https://lore.kernel.org/r/20251015-b4-l1tf-percpu-v2-1-6d7a8d3d40e9%40google.com
patch subject: [PATCH v2] KVM: x86: Unify L1TF flushing under per-CPU variable
config: i386-buildonly-randconfig-006-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161649.QbfhDLy3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161649.QbfhDLy3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161649.QbfhDLy3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_write_guest_virt_system':
>> arch/x86/kvm/x86.c:8003:9: error: implicit declaration of function 'kvm_set_cpu_l1tf_flush_l1d_raw'; did you mean 'kvm_set_cpu_l1tf_flush_l1d'? [-Wimplicit-function-declaration]
    8003 |         kvm_set_cpu_l1tf_flush_l1d_raw();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         kvm_set_cpu_l1tf_flush_l1d


vim +8003 arch/x86/kvm/x86.c

  7998	
  7999	int kvm_write_guest_virt_system(struct kvm_vcpu *vcpu, gva_t addr, void *val,
  8000					unsigned int bytes, struct x86_exception *exception)
  8001	{
  8002		/* kvm_write_guest_virt_system can pull in tons of pages. */
> 8003		kvm_set_cpu_l1tf_flush_l1d_raw();
  8004	
  8005		return kvm_write_guest_virt_helper(addr, val, bytes, vcpu,
  8006						   PFERR_WRITE_MASK, exception);
  8007	}
  8008	EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_write_guest_virt_system);
  8009	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
