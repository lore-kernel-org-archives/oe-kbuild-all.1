Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D721A4DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731454353; cv=none; b=DmI3uYJk5YtND9uV+KaXKaid3RCFlOaaZG5svKNLI5wbl7BbneHhr88/JXUkHQn6daQKOiF8/NGjYuxTgfQMxl6ciU0dY+v65eSUaNwC5W7HbE+DwZ+HQcbfaa6ywee0X4Lc9l1QYJ/tnpY/Gqh6LhwrPxn7ydkIb0oa06oQ/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731454353; c=relaxed/simple;
	bh=yBG3WykMJE3Nr8RDQorGaCb2sofsRDcyZjVX0b43c94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQxHXDI+CT842NEAYpJb+Wq5KpO7r3Oi2gBYqdJ77H50C6Ai3MyV3AYMNtrGKi00jZfTWK3JtOipKdEgR7BM4K9aXsfu5wD4rnytNDf24yXPGX+YunGislDiRyHyQIcCij2wBjFvfJjdQkFg8oXSL0mKRROTXUYXGdaBBNyx6Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hopx4Sld; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hopx4Sld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731454351; x=1762990351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yBG3WykMJE3Nr8RDQorGaCb2sofsRDcyZjVX0b43c94=;
  b=Hopx4SldA1Z6TOfL64bTxLZiGXUO/mak/XPgWCkyuDeULq8ZmpivjbI+
   sk5mvHFpiYPptZMOGCyAEzWQZovIgOp5lQmlzsszjFuhieGae2PTSQK+z
   7SPbVlFGmY9vJAbSNuJnop98ly/uuWf5V9ZF8vq54CL4+01Gmyf6NyCnq
   +N0QHiX9n9fwedqo5N4ryEF0HfXwVuwP56NfdB69OtFq8kpcv9O43A1/W
   Nf4OXdcQScq9KbI+mYZBa3mt91EBRJ3coR4MWYwCkl/GgaLOD2WgO26G8
   FW2vnPaSgsLbqvLoY7cQdLYlbeDO4DK6IekATs5qGmzYY8HY+daZnxXMB
   A==;
X-CSE-ConnectionGUID: BBH1PenGTsK9xkFNOQEK3w==
X-CSE-MsgGUID: abDjTMubRbGYCuRDLxskwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="56711085"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="56711085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 15:32:28 -0800
X-CSE-ConnectionGUID: l0+pAx3LQbadpf4pG9U9/Q==
X-CSE-MsgGUID: V8SOY6DOTEW2iWZCy7wmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="125201380"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Nov 2024 15:32:28 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0Mz-0001ph-1j;
	Tue, 12 Nov 2024 23:32:25 +0000
Date: Wed, 13 Nov 2024 07:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/drm_edid_to_speaker_allocation 12/12]
 drivers/gpu/drm/drm_edid.c:5734: warning: Function parameter or struct
 member 'psads' not described in 'drm_edid_to_sad'
Message-ID: <202411130956.YVqNJbt7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/drm_edid_to_speaker_allocation
head:   355e5bfdfa2aa4453539604f34471670738f4bf4
commit: 355e5bfdfa2aa4453539604f34471670738f4bf4 [12/12] drm: Pass drm_edid to drm_edid_to_sad()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241113/202411130956.YVqNJbt7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130956.YVqNJbt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130956.YVqNJbt7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_edid.c:5734: warning: Function parameter or struct member 'psads' not described in 'drm_edid_to_sad'
>> drivers/gpu/drm/drm_edid.c:5734: warning: Excess function parameter 'sads' description in 'drm_edid_to_sad'


vim +5734 drivers/gpu/drm/drm_edid.c

76adaa34db407f Wu Fengguang     2011-09-05  5721  
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5722  /**
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5723   * drm_edid_to_sad - extracts SADs from EDID
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5724   * @drm_edid: EDID to parse
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5725   * @sads: pointer that will be set to the extracted SADs
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5726   *
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5727   * Looks for CEA EDID block and extracts SADs (Short Audio Descriptors) from it.
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5728   *
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5729   * Note: The returned pointer needs to be freed using kfree().
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5730   *
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5731   * Return: The number of found SADs or negative number on error.
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5732   */
355e5bfdfa2aa4 Thomas Weißschuh 2024-08-18  5733  int drm_edid_to_sad(const struct drm_edid *drm_edid, struct cea_sad **psads)
fe214163cc6e6b Rafał Miłecki    2013-04-19 @5734  {
b07debc2a8ce73 Jani Nikula      2022-05-03  5735  	const struct cea_db *db;
b07debc2a8ce73 Jani Nikula      2022-05-03  5736  	struct cea_db_iter iter;
fe214163cc6e6b Rafał Miłecki    2013-04-19  5737  	int count = 0;
fe214163cc6e6b Rafał Miłecki    2013-04-19  5738  
5e87b2e5171621 Jani Nikula      2022-05-09  5739  	cea_db_iter_edid_begin(drm_edid, &iter);
b07debc2a8ce73 Jani Nikula      2022-05-03  5740  	cea_db_iter_for_each(db, &iter) {
9d72b7e2d2ce37 Jani Nikula      2022-05-03  5741  		if (cea_db_tag(db) == CTA_DB_AUDIO) {
e8d0b2c06fd779 Jani Nikula      2023-10-31  5742  			struct cea_sad *sads;
8af4681189e58a Jani Nikula      2023-10-31  5743  			int i;
948de84233d32b Suraj Upadhyay   2020-07-02  5744  
b07debc2a8ce73 Jani Nikula      2022-05-03  5745  			count = cea_db_payload_len(db) / 3; /* SAD is 3B */
e8d0b2c06fd779 Jani Nikula      2023-10-31  5746  			sads = kcalloc(count, sizeof(*sads), GFP_KERNEL);
e8d0b2c06fd779 Jani Nikula      2023-10-31  5747  			*psads = sads;
e8d0b2c06fd779 Jani Nikula      2023-10-31  5748  			if (!sads)
fe214163cc6e6b Rafał Miłecki    2013-04-19  5749  				return -ENOMEM;
8af4681189e58a Jani Nikula      2023-10-31  5750  			for (i = 0; i < count; i++)
8af4681189e58a Jani Nikula      2023-10-31  5751  				drm_edid_cta_sad_set(&sads[i], &db->data[i * 3]);
fe214163cc6e6b Rafał Miłecki    2013-04-19  5752  			break;
fe214163cc6e6b Rafał Miłecki    2013-04-19  5753  		}
fe214163cc6e6b Rafał Miłecki    2013-04-19  5754  	}
b07debc2a8ce73 Jani Nikula      2022-05-03  5755  	cea_db_iter_end(&iter);
b07debc2a8ce73 Jani Nikula      2022-05-03  5756  
b07debc2a8ce73 Jani Nikula      2022-05-03  5757  	DRM_DEBUG_KMS("Found %d Short Audio Descriptors\n", count);
fe214163cc6e6b Rafał Miłecki    2013-04-19  5758  
fe214163cc6e6b Rafał Miłecki    2013-04-19  5759  	return count;
fe214163cc6e6b Rafał Miłecki    2013-04-19  5760  }
fe214163cc6e6b Rafał Miłecki    2013-04-19  5761  EXPORT_SYMBOL(drm_edid_to_sad);
fe214163cc6e6b Rafał Miłecki    2013-04-19  5762  

:::::: The code at line 5734 was first introduced by commit
:::::: fe214163cc6e6b33253b7ac14bc3dd616e76b513 drm: add drm_edid_to_eld helper extracting SADs from EDID (v2)

:::::: TO: Rafał Miłecki <zajec5@gmail.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
