Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49B2F37
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722393014; cv=none; b=F+XajBXIxCiM73ZTgVEL67Z+Bl8RF7RHjU3jkUKJBFkEYRlgHf6/+z78PRcU5R0MSU9dx1pqC6qGlaN30Ar7/ITTze7JVgBS9odbBZMCHbxIAeV9u1xX4OlEhnCgarNYsfvfY4LBJgL7ACxG3bW6fG8qyL+3UrlzEdZ9obCWBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722393014; c=relaxed/simple;
	bh=6uAEMUk5PreydjSVoBbHB0wXQK8ZaZp3YtcAp8R4WAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vl4+RbcplKk7cwX3z3zHGmE3woUdjKHdxcZc1ytiSizwRSiKTT1+/qTinQsPVV7+3WvUFjKejn0uMUrGwPf0DgnnoaTebBOvh4t6i8x02hEqSEzTpwle/FYKqtJl9AyTNFMb8jbOGM+OEyi0hzyKGiPmZj5oCtw7nKMWgo8HgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaA3zyVU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaA3zyVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722393013; x=1753929013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uAEMUk5PreydjSVoBbHB0wXQK8ZaZp3YtcAp8R4WAs=;
  b=ZaA3zyVUHkye7voZ6xAUqDKXbWt5A5jdGbleDq5j6msS2rtqRkM7CUYj
   S3vsgHF94JZItKPKs6v6VvVm1jREfQOpWZIlDzM5XGyDgpvLaZUzOKJfc
   7UJlWhMgSGjl6lVU/JgrAkCoX930pA4TwiwADj/bLMrr0WVxJaxIrqidD
   rzaB51ycx7Qe/Ljqvd8p/R7jCVwkVaHlKwbLOyfNQw8eVGPjArpSRVbu2
   LKnc4VgOV72m7bhEhawP1SgNjmqepKLG7dpzMlt2n9OmUEpUXuOx8Cbcd
   xdyQkLX6y9eYR598+piZwowX17Y19v5QyYJx8LhUHDwZFZF0Wg6I/RsTp
   Q==;
X-CSE-ConnectionGUID: M13fMIhESTSSUjJVqYq4fQ==
X-CSE-MsgGUID: ue/NdC3STZKZpeplWPWifw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30831818"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="30831818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 19:30:12 -0700
X-CSE-ConnectionGUID: /cvgKe9iR0iXeF9xrDAbBg==
X-CSE-MsgGUID: qLBsGbgCRDGkfr/XClKYDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="85174171"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2024 19:30:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYz6N-000teS-3A;
	Wed, 31 Jul 2024 02:30:07 +0000
Date: Wed, 31 Jul 2024 10:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13169/23386] mm/userfaultfd.o: warning:
 objtool: mcopy_atomic()+0x1e78: unreachable instruction
Message-ID: <202407311035.uLDyyIFP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e5ea67ef45bf84add14bf009f071b29909f087cb
commit: 8b9ea9010139596e71aae4be5264c3dd901b13cb [13169/23386] pagecache: support percpu refcount to imporve performance
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311035.uLDyyIFP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311035.uLDyyIFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311035.uLDyyIFP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/userfaultfd.c:12:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> mm/userfaultfd.o: warning: objtool: mcopy_atomic()+0x1e78: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
