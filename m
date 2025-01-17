Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449E13B2A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737155871; cv=none; b=dWTc2WPFTkghJPhPbTaclgJzCe/O9jO5ppCjNoxIR/zm/QtxJfkHuVOIr2F/1+dCOEcKYZX3kvw12a6bsJKAZMEGu2GCv1jA6VGJJErQnP+rShtnNWujCvYoQ9QeMzWKZ8v1eKkIGUr/YJnoBwK8cbcsKUul2D7dWwN6SOnKO8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737155871; c=relaxed/simple;
	bh=Emo9gCD05l0LTy7VpzGtj+YnGZZAMnrsdwPP95lFshU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTE9mWbXVVt35kHvX8Q4E43SNxGPFdagSICLc9xRY4QyB6o0pjLFmjSHhCBGRhUiV4ALiIWavCTlelU96yXPtKomNkGEQp/k2vyGVofxYb/4QvB7WNCb2bmqt1iuaLmTNGOqye/Vi7OywGfbjc+ZGu4y2I5Q0LWF57WxxDtZZjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsv71+yT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsv71+yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737155870; x=1768691870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Emo9gCD05l0LTy7VpzGtj+YnGZZAMnrsdwPP95lFshU=;
  b=hsv71+yTBFQOYIvWuv5bKmLnc4xf9Y5FfsgyPZUU9ByDCuCP72fozj+s
   WTAubWq+Ylr3jirgFBPg6FkAMlc+vydiOrhaKdxxvJzZPeiBdggGBirN6
   baeKHtaFCk8NwblU74WEadploSRQvsHltWVXVQgUaLSUHKcO/z6ik5B7O
   S8gK9OMQfCfU3LOeHECPlORW4lSEBtWgBXQymnCLeXBnaLEVcWPpfQW0Z
   1WNq23nVqcruuTgylQXcWBASCOa6QuU/xj/pX3t1/mpDQxAs60jHht59V
   fbDSOqoQRDFsSM9ejMrk7iYXYWGmWsNxG2P5wfLjFBSVDaeFjLT4JIRA3
   A==;
X-CSE-ConnectionGUID: rWYL/EhxTHmyNQECBmx83Q==
X-CSE-MsgGUID: Va01HRI6TYq2bghH2SXgLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37296946"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37296946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 15:17:49 -0800
X-CSE-ConnectionGUID: kDmC99fhSieEuHius7pFJQ==
X-CSE-MsgGUID: cvR0DU7rQ1i5C1jpZ73/MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="106490142"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jan 2025 15:17:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYvaz-000Toh-2J;
	Fri, 17 Jan 2025 23:17:45 +0000
Date: Sat, 18 Jan 2025 07:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1] mm/vmscan.c:4621:5:
 warning: no previous prototype for 'print_node_mglru'
Message-ID: <202501180721.CIMoSk0Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   354b0c4c1ebb89a4198fdec59a447bc102320bac
commit: 2038834ed810ff10b875445a030663d659c69500 [1/1] CHROMIUM: Reland of add implementation of MGLRU in sysfs
config: arm64-randconfig-002-20250116 (https://download.01.org/0day-ci/archive/20250118/202501180721.CIMoSk0Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180721.CIMoSk0Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180721.CIMoSk0Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:678:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     678 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
>> mm/vmscan.c:4621:5: warning: no previous prototype for 'print_node_mglru' [-Wmissing-prototypes]
    4621 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         |     ^~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'show_lru_gen_admin':
   mm/vmscan.c:4691:62: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'void *' [-Wformat=]
    4691 |                                                 "memcg %5hu %s\n", mem_cgroup_id(memcg), path);
         |                                                             ~^                           ~~~~
         |                                                              |                           |
         |                                                              char *                      void *
         |                                                             %p
   mm/vmscan.c:4702:21: warning: assignment to 'char *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
    4702 |                 buf = PAGE_SIZE - 1;
         |                     ^


vim +/print_node_mglru +4621 mm/vmscan.c

  4620	
> 4621	int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
  4622	{
  4623		unsigned long seq;
  4624		struct lrugen *lrugen = &lruvec->evictable;
  4625	
  4626		DEFINE_MAX_SEQ(lruvec);
  4627		DEFINE_MIN_SEQ(lruvec);
  4628	
  4629		int print_pos = orig_pos;
  4630	
  4631		seq = min(min_seq[0], min_seq[1]);
  4632	
  4633		for (; seq <= max_seq; seq++) {
  4634			int gen, type, zone;
  4635			unsigned int msecs;
  4636	
  4637			gen = lru_gen_from_seq(seq);
  4638			msecs = jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]));
  4639	
  4640			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos,
  4641				" %10lu %10u", seq, msecs);
  4642	
  4643			for (type = 0; type < ANON_AND_FILE; type++) {
  4644				long size = 0;
  4645	
  4646				if (seq < min_seq[type]) {
  4647					print_pos += snprintf(buf + print_pos,
  4648						PAGE_SIZE - print_pos, "         -0 ");
  4649					continue;
  4650				}
  4651	
  4652				for (zone = 0; zone < MAX_NR_ZONES; zone++)
  4653					size += READ_ONCE(lrugen->sizes[gen][type][zone]);
  4654	
  4655				print_pos += snprintf(buf + print_pos,
  4656					PAGE_SIZE - print_pos, " %10lu ", max(size, 0L));
  4657			}
  4658	
  4659			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos, "\n");
  4660	
  4661		}
  4662	
  4663		return print_pos - orig_pos;
  4664	}
  4665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
