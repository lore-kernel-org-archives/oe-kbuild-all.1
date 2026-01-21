Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF22472BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769017834; cv=none; b=XQVndxZq8lIbGp/iMqyZpIfjVKppKgt6WvN+JsR9VmVNbR1sJdmUJHQdPT6Dc2d6GvlhcWSjWai9U+9jm+1NolWDI76Ps8ZoMjv3S4zCZoinlc2ow/SWrUe3eMQQy/lm8nABVUaADtkxSJ8MkvbzNYaS3K4GuBoJKthlZ5jtt1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769017834; c=relaxed/simple;
	bh=9aYwxws7ZCc9YL7osroT+LHl6v3IlVsB+RYFfQ3l3Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1I31MdL1C+DOlK6j5ZGXrGxUIDWgfgUoqhpB6qFtDI8to76z+zQnEbeIDuvCXvlVhomiXkfbNe+LCeCCgPdO9sPffYfVeF8TS6ZnIFqroeG0cMGIfwU2ewmzlMx0p9xedKov4qD2hv+fv6YWs8N5ieFxu538amhNw8UWkbMxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB8QoMRI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB8QoMRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769017832; x=1800553832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9aYwxws7ZCc9YL7osroT+LHl6v3IlVsB+RYFfQ3l3Nw=;
  b=aB8QoMRI95CHRo98NadJDosjTnXDkznjRvzwWt0wj3rBnt4fGeuZm1x1
   SQpvzjcADdP+sIrriEYZNUpu4LQPt0zoYyofKeczhcOtyxhs7c1iSzj7r
   eV5GhEWViWuPeCPdhPjIs6H64uFU42dn7uDe68I0WtGfhLerA+lesEmGt
   76u1QzAp0WnlEEuasEpNdzSxDRBEpUrWOtnK13BEyp0+HkHsmQJ82u6GR
   3mbDW1+2MPRlThhkjY87pYKV7b2QqEZZNUFQ1hlMLUaHIFZlUbwFtNZ1L
   oRo1Zd3iAE/+2zZJgHycHu9lEtdfUITFaJNJwuI+Rt7zhq278PFgGx6gJ
   A==;
X-CSE-ConnectionGUID: MclYVuzaRMGFme5eY0H4+w==
X-CSE-MsgGUID: Abfe00HhSO2CA/xts0uflA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70345595"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70345595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 09:50:31 -0800
X-CSE-ConnectionGUID: Pxbka8IERJ+8sfHy8hfWPA==
X-CSE-MsgGUID: /E8qZgKSTn+mKVBO9/q1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206410301"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 09:50:28 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vicLa-000000000LN-0JxW;
	Wed, 21 Jan 2026 17:50:26 +0000
Date: Wed, 21 Jan 2026 18:50:15 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Courrege <thomas.courrege@thorondor.fr>, ashish.kalra@amd.com,
	corbet@lwn.net, herbert@gondor.apana.org.au, john.allen@amd.com,
	nikunj@amd.com, pbonzini@redhat.com, seanjc@google.com,
	thomas.lendacky@amd.com
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Courrege <thomas.courrege@thorondor.fr>
Subject: Re: [PATCH v3 RESEND v3 1/1] KVM: SEV: Add KVM_SEV_SNP_HV_REPORT_REQ
 command
Message-ID: <202601211817.KSIaB5Gc-lkp@intel.com>
References: <20260119164228.2108498-2-thomas.courrege@thorondor.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119164228.2108498-2-thomas.courrege@thorondor.fr>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.19-rc6 next-20260120]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Courrege/KVM-SEV-Add-KVM_SEV_SNP_HV_REPORT_REQ-command/20260120-005438
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260119164228.2108498-2-thomas.courrege%40thorondor.fr
patch subject: [PATCH v3 RESEND v3 1/1] KVM: SEV: Add KVM_SEV_SNP_HV_REPORT_REQ command
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601211817.KSIaB5Gc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211817.KSIaB5Gc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
   Documentation/virt/kvm/x86/amd-memory-encryption.rst:584: ERROR: Unexpected indentation. [docutils]
>> Documentation/virt/kvm/x86/amd-memory-encryption.rst:600: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]


vim +600 Documentation/virt/kvm/x86/amd-memory-encryption.rst

   592	
   593	::
   594	        struct kvm_sev_snp_hv_report_req {
   595	                __u64 report_uaddr;
   596	                __u64 report_len;
   597	                __u8 key_sel;
   598	                __u8 pad0[7];
   599	                __u64 pad1[4];
 > 600	        };
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
