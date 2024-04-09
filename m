Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF9A18E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 00:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712621650; cv=none; b=OQD2nFq2HBboY6wvO4qEyTAhMQEBwd9qtg5k09yP6DrHX8SYv2a5Gk6RboIs9tmqytRyUdbt6YmEtC9KaD+2HjwvSmRFP4AsEBegqZuhFf1YTgTrRMr2zfzTc+n3eSkQfjluftwK4WyjQxJMz1W/ulmPri7xiHWNfBqfEP55bQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712621650; c=relaxed/simple;
	bh=kBMlZgIpE4rA78AEM/tbgSQBEOnC9VNNcR1j4TrFHT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFZ70famoUZm9Ed5DStDPaYyruPMEybHwLR/5OOdagPOkAtHFypapkarxM4Th2GovbAfTmW5Fx3YlDDMAUhAP9CKMkLuqj8gfLeRpUnGOkxX4bVvCyJWJ70O/XNpoJBNtzeZtts34p26P1S9Ke8x1bE5Vql6jyIs/5GsdeK+xvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJmCnQOC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJmCnQOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712621649; x=1744157649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBMlZgIpE4rA78AEM/tbgSQBEOnC9VNNcR1j4TrFHT0=;
  b=CJmCnQOC9arjHkkfSKj/ZRR9RqyrF2GFpPtFw9aSWfiLV7mvwYnt9Afb
   Y2hSeFnQTPxOVTNTHRCBR66R5vZ05qRJ+K2oIXTiuqPZPSio6vWvGb016
   9mISCSr7TrqDwvoGxvd1Rqm/zM1zfr9lrE6UMewYRohHwFd5vzKVbWrbE
   m+ERdo/PX5XvOQPDvkqvM3v+eCOZhXml27NHilsSsY6SoBXtihejTJCvZ
   EGIgDmPESywxQee4MwNjBgmcXLOCMPMrbErz3RuDrnq9+LXcDzbhKe05x
   p2P8BCl5/TlJJqb8PUsRcQWlPlaeCm46HEHd2m8rkqoMMxh4HAhys5uzw
   Q==;
X-CSE-ConnectionGUID: 1rmAcJ3XQNOp6IGul/lRPQ==
X-CSE-MsgGUID: YWtm5DQNRyCpAZs6PlC/PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7767639"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="7767639"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 17:14:08 -0700
X-CSE-ConnectionGUID: Ggmkd1qfREWHN5/iOZsZ6g==
X-CSE-MsgGUID: AQNtNIjgTeKtxGLJ4zhviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="20613512"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Apr 2024 17:14:07 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtz7k-0005Zu-2S;
	Tue, 09 Apr 2024 00:14:04 +0000
Date: Tue, 9 Apr 2024 08:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 7/166] mm/util.c:237: warning: expecting
 prototype for iterdup_user(). Prototype was for iterdup() instead
Message-ID: <202404090859.Fub1iO6k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   e7bbb29bad7bb57e91d8a49a5aab3797680b1560
commit: cfd08a0581c2cb061bcf6d1afe9d1b57166902bd [7/166] mm/util: add iterdup_nul() and iterdup() helpers
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240409/202404090859.Fub1iO6k-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090859.Fub1iO6k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090859.Fub1iO6k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/util.c:237: warning: expecting prototype for iterdup_user(). Prototype was for iterdup() instead


vim +237 mm/util.c

   226	
   227	/**
   228	 * iterdup_user - duplicate memory region
   229	 *
   230	 * @src: source iov_iter
   231	 * @len: number of bytes to copy
   232	 *
   233	 * Return: an ERR_PTR() on failure.  Result is physically
   234	 * contiguous, to be freed by kfree().
   235	 */
   236	void *iterdup(struct iov_iter *src, size_t len)
 > 237	{
   238		void *p;
   239	
   240		p = kmalloc_track_caller(len, GFP_USER | __GFP_NOWARN);
   241		if (!p)
   242			return ERR_PTR(-ENOMEM);
   243	
   244		if (!copy_from_iter_full(p, len, src)) {
   245			kfree(p);
   246			return ERR_PTR(-EFAULT);
   247		}
   248	
   249		return p;
   250	}
   251	EXPORT_SYMBOL(iterdup);
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
