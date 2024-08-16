Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974141BDA84
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723824126; cv=none; b=mrDxKniXWQHIoASUp0vG4FrQCmjzmdiHU32JcWH3y7MOeBfw5pMYeEo7rdd2O59Sa1X2zi1o7bVCCuDx3zkKFK6VkyGITybnSFovDjkBIIIAbacRN3fv/d/Z+MRkAlf7GUW0vyvM9f/n/PGyLONDHfgdv2VztIqtYBWGSnUg6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723824126; c=relaxed/simple;
	bh=PnA9sZymCyaPizlvTbc9SoO5YjmcWdmPNMfoDLtbec4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPxdvxUM3sywe5Exf72+aCUNr8NGNT4EGdOuCrD8vDrGZnbhf2Q+/yXwUwNZ4tMnZPybgZU7T8GM2g6zyIngH10K+fIzd5hrNf8Uf41nTo1eLBk6McFVrH4e65ceVZa6BiBlTGOOKrMf1DXCrm+DlpChPbNFBuyfCuVtIGZdYaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPPRa5lj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPPRa5lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723824124; x=1755360124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PnA9sZymCyaPizlvTbc9SoO5YjmcWdmPNMfoDLtbec4=;
  b=iPPRa5lj8CvKlOMj+dmCUuZd3lFtQJ3fnD0Qs65rgiVaujK5QmSxQxMd
   +DCH/arkjMOMlp9KAjqzetGciPUD+UdBPpAkyoeXcvl8pxzEoIZjj3C04
   yTN6JNUM/sdsznZf8ZmFlW11Q8DaAwf/yNjgmorbze8Hv0Du6GnZqcYIY
   s2QfyFWPaoKXqpaSgsUxOzjn5Nk6m9xZL6A+MHx5+54kPPOpYhmR/Yr5C
   Lft3uNtS/FWKZZ8qScKRi5Rf7Wy2+HGGF6S6gleRIUrxcIMUWqwzAomO2
   TLPctdJjoToPMsMl/o0et8waseufMkarerjdfdmhcc2LFnAGpEEFE5MxO
   g==;
X-CSE-ConnectionGUID: +oRPzK+jQ4qyRYKZfy+QDQ==
X-CSE-MsgGUID: jmnONNTcRM6QyxSgVIp/+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32760479"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32760479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 09:02:04 -0700
X-CSE-ConnectionGUID: IWdQoqQFSc6mz9+yhKPyNA==
X-CSE-MsgGUID: sLQhxl29TAOmaGZ+LzGZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="97224245"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 09:02:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sezOq-0006bs-2D;
	Fri, 16 Aug 2024 16:02:00 +0000
Date: Sat, 17 Aug 2024 00:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Maciek Machnikowski <maciek@machnikowski.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] ptp: Implement timex esterror support
Message-ID: <202408162353.wlesbwqg-lkp@intel.com>
References: <20240813125602.155827-2-maciek@machnikowski.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813125602.155827-2-maciek@machnikowski.net>

Hi Maciek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes net/main net-next/main linus/master horms-ipvs/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciek-Machnikowski/ptp-Implement-timex-esterror-support/20240814-233156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240813125602.155827-2-maciek%40machnikowski.net
patch subject: [RFC 1/3] ptp: Implement timex esterror support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240816/202408162353.wlesbwqg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162353.wlesbwqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162353.wlesbwqg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_clock.c: In function 'ptp_clock_adjtime':
>> drivers/ptp/ptp_clock.c:168:20: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
     168 |                 if (ops->setesterror)
         |                    ^


vim +/else +168 drivers/ptp/ptp_clock.c

   117	
   118	static int ptp_clock_adjtime(struct posix_clock *pc, struct __kernel_timex *tx)
   119	{
   120		struct ptp_clock *ptp = container_of(pc, struct ptp_clock, clock);
   121		struct ptp_clock_info *ops;
   122		int err = -EOPNOTSUPP;
   123	
   124		if (ptp_clock_freerun(ptp)) {
   125			pr_err("ptp: physical clock is free running\n");
   126			return -EBUSY;
   127		}
   128	
   129		ops = ptp->info;
   130	
   131		if (tx->modes & ADJ_SETOFFSET) {
   132			struct timespec64 ts;
   133			ktime_t kt;
   134			s64 delta;
   135	
   136			ts.tv_sec  = tx->time.tv_sec;
   137			ts.tv_nsec = tx->time.tv_usec;
   138	
   139			if (!(tx->modes & ADJ_NANO))
   140				ts.tv_nsec *= 1000;
   141	
   142			if ((unsigned long) ts.tv_nsec >= NSEC_PER_SEC)
   143				return -EINVAL;
   144	
   145			kt = timespec64_to_ktime(ts);
   146			delta = ktime_to_ns(kt);
   147			err = ops->adjtime(ops, delta);
   148		} else if (tx->modes & ADJ_FREQUENCY) {
   149			long ppb = scaled_ppm_to_ppb(tx->freq);
   150			if (ppb > ops->max_adj || ppb < -ops->max_adj)
   151				return -ERANGE;
   152			err = ops->adjfine(ops, tx->freq);
   153			ptp->dialed_frequency = tx->freq;
   154		} else if (tx->modes & ADJ_OFFSET) {
   155			if (ops->adjphase) {
   156				s32 max_phase_adj = ops->getmaxphase(ops);
   157				s32 offset = tx->offset;
   158	
   159				if (!(tx->modes & ADJ_NANO))
   160					offset *= NSEC_PER_USEC;
   161	
   162				if (offset > max_phase_adj || offset < -max_phase_adj)
   163					return -ERANGE;
   164	
   165				err = ops->adjphase(ops, offset);
   166			}
   167		} else if (tx->modes & ADJ_ESTERROR) {
 > 168			if (ops->setesterror)
   169				if (tx->modes & ADJ_NANO)
   170					err = ops->setesterror(ops, tx->esterror * 1000);
   171				else
   172					err = ops->setesterror(ops, tx->esterror);
   173		} else if (tx->modes == 0) {
   174			long esterror;
   175	
   176			tx->freq = ptp->dialed_frequency;
   177			if (ops->getesterror) {
   178				err = ops->getesterror(ops, &esterror, NULL, NULL);
   179				if (err)
   180					return err;
   181				tx->modes &= ADJ_NANO;
   182				tx->esterror = esterror;
   183			} else {
   184				err = 0;
   185			}
   186		}
   187	
   188		return err;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
