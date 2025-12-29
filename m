Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8296531196C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 22:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767048119; cv=none; b=utKnEA026/OGkBzQUYjpEaJvObG2+gYPnyHluwhOV89HNQj87EqVdOeu20JBg3xlPnPcpyzw39u3L89nnS/CI/eDmwDhvkvzWA6lKN2wMI8QOcoeVPpY4CimfoGdc81MfugNPhT4gZdtKiYMiHL9Xy+MKG2OUcFkg0mrRTK0OwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767048119; c=relaxed/simple;
	bh=WtV4ARF0rfxW6Gu2M9TXyQuY1K9uPg/Z0j7CjzrG7z8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sHriAmv5e9AE6mqTjL5hmq3vAh7Nj57xdSc+1g9Td3oM+EorNUVd5zlSt7VQitqowBka3lFc5ooj61aUsVJJD2hLhWFI5nlqfqERZVr44dWk9c5q9mvQ7k8gYIUJTIVOK5pYAKLTQGJuvw3FrC/4osja1WFRGcb6cvDIbNuJgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBCWoBtg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBCWoBtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767048117; x=1798584117;
  h=date:from:to:cc:subject:message-id;
  bh=WtV4ARF0rfxW6Gu2M9TXyQuY1K9uPg/Z0j7CjzrG7z8=;
  b=fBCWoBtgLiCkZAmQUHyrfu7aMv63H2M0+cNRbic2IvffcB/dyKWIwo1N
   D9A8ekLIlZ/tPbHt8z1iMxn1jVmW7UsNq+bQmAZKDEZZVLH8W6f9XTSlP
   nVUcfDIS3/kJhrfvrYbCOR7OqHaiil6jnf4rv/Po27DC8GpDKO5YcwYPs
   aPaSQBLlGvF5zcr0b05RDyQ1VXfLVZAoojO5SoVRE66APt7YUmWfqHsL3
   pZRR4lZ6LlN5UO5cjzvZaQTmSn793UCDZyasMgdgnSfz1anOEelh/XlpF
   4W6fWms9Q7TwZ4GdkaEpxAJ2t9cABtdCD0jcB225skzNBCVzpYATGDoER
   w==;
X-CSE-ConnectionGUID: QA5iCl3CQReVvebsTc4cfw==
X-CSE-MsgGUID: QMOtkso+QtOZbDz2043NaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68724001"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="68724001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 14:41:57 -0800
X-CSE-ConnectionGUID: jjFwfPATQL2O1QtkkPhvBg==
X-CSE-MsgGUID: ZawaC6xxRlWZM2Skvrc9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="206081319"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Dec 2025 14:41:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaLvp-00000000867-0Qpb;
	Mon, 29 Dec 2025 22:41:43 +0000
Date: Tue, 30 Dec 2025 06:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 0/15]
 drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202512300647.04amRDIb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f148785f0bb856bba8ceca2b699a2f102f22174a
commit: be5ee944496f8e6f9b5d12ef9ce89ab7100fc84a [0/15] driver/virt/coco: Add HYGON CSV Guest dirver.
config: x86_64-randconfig-122-20251230 (https://download.01.org/0day-ci/archive/20251230/202512300647.04amRDIb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300647.04amRDIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300647.04amRDIb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] *[addressable] report_data @@
   drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse:     expected void const [noderef] __user *from
   drivers/virt/coco/csv-guest/csv-guest.c:39:43: sparse:     got unsigned char [usertype] *[addressable] report_data
>> drivers/virt/coco/csv-guest/csv-guest.c:49:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] *[addressable] report_data @@
   drivers/virt/coco/csv-guest/csv-guest.c:49:29: sparse:     expected void [noderef] __user *to
   drivers/virt/coco/csv-guest/csv-guest.c:49:29: sparse:     got unsigned char [usertype] *[addressable] report_data

vim +39 drivers/virt/coco/csv-guest/csv-guest.c

    19	
    20	static long csv_get_report(void __user *argp)
    21	{
    22		u8	*csv_report;
    23		long	ret;
    24		struct	csv_report_req req;
    25	
    26		if (copy_from_user(&req, argp, sizeof(struct csv_report_req)))
    27			return -EFAULT;
    28	
    29		if (req.len < CSV_REPORT_INPUT_DATA_LEN)
    30			return -EINVAL;
    31	
    32		csv_report = kzalloc(req.len, GFP_KERNEL);
    33		if (!csv_report) {
    34			ret = -ENOMEM;
    35			goto out;
    36		}
    37	
    38		/* Save user input data */
  > 39		if (copy_from_user(csv_report, req.report_data, CSV_REPORT_INPUT_DATA_LEN)) {
    40			ret = -EFAULT;
    41			goto out;
    42		}
    43	
    44		/* Generate CSV_REPORT using "KVM_HC_VM_ATTESTATION" VMMCALL */
    45		ret = kvm_hypercall2(KVM_HC_VM_ATTESTATION, __pa(csv_report), req.len);
    46		if (ret)
    47			goto out;
    48	
  > 49		if (copy_to_user(req.report_data, csv_report, req.len))
    50			ret = -EFAULT;
    51	
    52	out:
    53		kfree(csv_report);
    54		return ret;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
