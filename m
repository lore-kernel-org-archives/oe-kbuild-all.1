Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038A39D6C0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772711939; cv=none; b=AcUSmcaZ1Z2YmM8wUSMaz6d+37wLWZWgn96JDVVgJCsemaHlTnQNPUOcBiUyuXtg0ybj2x50DdWOttZ29M1NhkKhj4dBgyrexlNG2zGBrMidskjvKji0utgM+WuNPWmCnHYrJlfRvtcsZyt8+9UTHVQoW8sLaNx3HeoTzG/5ddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772711939; c=relaxed/simple;
	bh=WWRGI+KbGpsRJSAmm6vXGaQ/nIg6dH18FaRze5eZ3EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVV0Da7zq8xQqbKsqcOWRkjCBNvB8nJRUYdkpFBiCmLG6QCu2mZsyXvaeclsF5LUIl64UgOkHxFbp0n4zH+ApClBaa1t/PyEFLBhpxBAhWxnsg2uzerY87bfjr+0I8l+Z5tyQeLNREpNLqFixuIrJFVjscWX+MEqrq1My0DXODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYFwml6b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYFwml6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772711937; x=1804247937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WWRGI+KbGpsRJSAmm6vXGaQ/nIg6dH18FaRze5eZ3EM=;
  b=dYFwml6bWGuSLAuakNCwSBPhWzpXX7ZMRGceX1cNl87hhFMNrWxU9ux5
   D01Vx+EVxsueSrfMbpKN1mREZM08FoLs6ICxbN/ZMejYpfnCdxoYBKzts
   WHbbkYO9DGduH5g7UrihBWwnrpG17FBsigaHGEyruHlC8ikaIg8X3ax+n
   qjTVewZ2cHEYfzGT/9kMJ3WBPMUvRGmHITBjdfk3XqtIEIgi6kEytzshc
   rKacU3nLGGIgda/M+mWmNUV+0X0tVpQzCXWBw5NIdhICoZgUSfHwFyJjt
   CjOdn7t/KTdamIgeJQ8ZNb8Qeyys5zP6/I2q3G4wcpDEnrhd9Fr2pDAzN
   Q==;
X-CSE-ConnectionGUID: xsFDkvzMTxOmT8Lco3kQDA==
X-CSE-MsgGUID: P3UkBW1RQjyG7fetUMcaPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84429985"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="84429985"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 03:58:54 -0800
X-CSE-ConnectionGUID: V48aCbpvTxW94fjtuqflcg==
X-CSE-MsgGUID: ou9Oq/kHRZqVlZmilx+4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="215475899"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 03:58:52 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy7Lt-000000000Ys-34tS;
	Thu, 05 Mar 2026 11:58:49 +0000
Date: Thu, 5 Mar 2026 19:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, kernel-team@meta.com
Subject: Re: [PATCH bpf 1/3] bpf: fix mm lifecycle in open-coded task_vma
 iterator
Message-ID: <202603051901.tplxkNgS-lkp@intel.com>
References: <20260304142026.1443666-2-puranjay@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304142026.1443666-2-puranjay@kernel.org>

Hi Puranjay,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3ebc98c1ae7efda949a015990280a097f4a5453a]

url:    https://github.com/intel-lab-lkp/linux/commits/Puranjay-Mohan/bpf-fix-mm-lifecycle-in-open-coded-task_vma-iterator/20260304-224301
base:   3ebc98c1ae7efda949a015990280a097f4a5453a
patch link:    https://lore.kernel.org/r/20260304142026.1443666-2-puranjay%40kernel.org
patch subject: [PATCH bpf 1/3] bpf: fix mm lifecycle in open-coded task_vma iterator
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051901.tplxkNgS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051901.tplxkNgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051901.tplxkNgS-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/task_iter.c: In function 'do_bpf_iter_mmput':
>> kernel/bpf/task_iter.c:840:17: error: implicit declaration of function 'mmput_async' [-Wimplicit-function-declaration]
     840 |                 mmput_async(work->mm);
         |                 ^~~~~~~~~~~


vim +/mmput_async +840 kernel/bpf/task_iter.c

   833	
   834	static void do_bpf_iter_mmput(struct irq_work *entry)
   835	{
   836		struct bpf_iter_mmput_irq_work *work;
   837	
   838		work = container_of(entry, struct bpf_iter_mmput_irq_work, irq_work);
   839		if (work->mm) {
 > 840			mmput_async(work->mm);
   841			work->mm = NULL;
   842		}
   843	}
   844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
