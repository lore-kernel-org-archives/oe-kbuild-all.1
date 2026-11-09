Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205485;
	b=0PTYMttFdmxqILQiEG2DQxyTYy70bLRYV6FrKFqFjy7hpQ34+Mz27U/P/lusEy/+Zbra
	 4J+tcBqN8Fa+Wj76Z/2Go6YmORXcxkdr+6gONM0K+iX89eESdeqWGKFQWoX7OKOflIKQA
	 MrxVQccsTC8oBPyhDWNSeU0+foxhlvyE5MvRkmrB/gxeTNONa7dObRCozozLTX9SFcG4X
	 rLUwwyFihZTEFFQSf/6RZx+MNBb1rx2wP1pOyuvm4AziAy10UP3mUq6ayyQUctYpl+XMO
	 d1XVMFrcAAR2S7rf8MdH5vrx/FiOZKuqlI33p3iVTLJ9S8LePEs/IZGUGmFKH1hMAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205485;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eQbEKx9xMufs3cpWePsrC3f3RfF5/FJSvfxQAw/nFAg=;
	b=akJpQv+tEH/8pZH+w8dqh9TJR+h/Uz9+43Ri97LDDnUiP86Zqh76nFDRfhHlBBzA2rfX
	 SUW6RjM5SuNZURTmT1Kx/1vkPq9BF+9lh+XtPNDi+Jy/JWlwC12N3Nr1LjdlSBaCENjQ6
	 +63gVQKssoc8g29C4SHdjwvegx1/oTD6Qw9M5KbqUMdmjbAL8acJILLtZaHKrrSiAZIWY
	 vsKUEcDM+IFmFv6jS1iX92r8HSpWYuvaXIZ9AJsDBy0gB93SOlq5oen6MWLMQo2xHcijd
	 j/7vEBQWaPYH8KAll42ZmKnCgwGIuFbT9+ISWdXYuT77fVake+7Wib1uNvvHUFKI0Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNppN93C;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7A606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 06:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D7A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNppN93C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794205484; x=1825741484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YSso0Po3Ac6MsrirK9TwldtrkZcqVN03F1SxefX9FxQ=;
  b=RNppN93CqVyaszGqzsM7Un6boBXsSZD9Ix37kHnnC+xKT11We6gHxN5e
   RhHrKVQHYyhqi857lrhgR6gmlVSmoXXaUxDgLIvIQVjHebWTWbtlkrIHX
   I+NLC0jR0qDjIljxIxK1Dh43lrLCNIUveo0hYMZh1jek8e+ukbxBzCvHT
   CJFGCY6BGoRJvu4Mi6G4YK8ZSDz8rRjfiIRR878lT+EssOI/eQ/l3a7T1
   sE+HSBolDy8cYKuCWlzNhOeL88hRlqbvuZACoFS+33gq/8WDtBJfctm/w
   hj4RKiaEJqWD9te20rHTyc/YirdID5aOb0pjkzfanKyZNP2TtJmGNEGNk
   Q==;
X-CSE-ConnectionGUID: angGg5ZcQB6qMCe2DQq+xA==
X-CSE-MsgGUID: kjuOUBEZTmaXJVVWKjPoyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2913762"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2913762"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 22:24:43 -0800
X-CSE-ConnectionGUID: GzK1GYJdQue5f+Pi2BBMaQ==
X-CSE-MsgGUID: iW7KKfENRneZYXWo/Xw9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7824695"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2026 22:24:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQIny-00000000u1P-2AzQ;
	Mon, 09 Nov 2026 06:24:34 +0000
Date: Mon, 9 Nov 2026 14:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paul Durrant <paul@xen.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v12 08/24] KVM: x86: Re-synchronize TSC after
 KVM_SET_TSC_KHZ
Message-ID: <202611091411.tSxUx2Bj-lkp@intel.com>
References: <20261109012112.3415328-9-dwmw2@infradead.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109012112.3415328-9-dwmw2@infradead.org>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/KVM-x86-Improve-synchronization-in-kvm_synchronize_tsc/20261108-172047
base:   dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
patch link:    https://lore.kernel.org/r/20261109012112.3415328-9-dwmw2%40infradead.org
patch subject: [PATCH v12 08/24] KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
config: i386-buildonly-randconfig-1005-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091411.tSxUx2Bj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091411.tSxUx2Bj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091411.tSxUx2Bj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `kvm_synchronize_tsc_at':
>> x86.c:(.text+0xfaca): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
