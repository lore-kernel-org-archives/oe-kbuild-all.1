Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAC815AAD7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713435331; cv=none; b=mucnjZ2KSbdwwj4JSuTQyP5/mWIar3rgj1v+rzrqxaY34Zi1Ovqb3oBGaqp36ZA7hVuB973GrcH7ToOpE2l7fTumT6KsjpPVRfHfCpFKR7yau8TCqX08grnq8i6zp1Koa/VKwtU59Me2mXyrlg/domlVDYNhNsOAnC9VUV0/eoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713435331; c=relaxed/simple;
	bh=dM2Ae27slX3eGHoyQDGqxpE/2G3S2iGAPFAnIdIaQ2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8PSsN9xFD0hiLFoZn5GdBMZr/R7OrLzV3R8x1KstWiFNLKPzvFbseK2xFk80qOO6PMCXOARPhxSv7QMayyRXeOLCNu2xUUzpOeMUcw2GACjjkOg8IeM9A5zPR9Wth+G1qBTLIu2lE4Qborblo1mWKDLFTg5AQxF6Y6EZDXiwaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcDMPkNo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcDMPkNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713435330; x=1744971330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dM2Ae27slX3eGHoyQDGqxpE/2G3S2iGAPFAnIdIaQ2s=;
  b=YcDMPkNox5YxAwkF2aMlXs2kp6miN66w3SZiTIEmzi5Xov5xy8qGPxlo
   kU2pPmZ51Bp32ajhaVUZM4ZZoBmerc9oT9rUS0C7brju3IskGOr6G1NQ8
   P62PP6dop4ng1xLskNWqB0z/9U9DH4Zm7Pf2p5BDHC5v8uQbBWrLgnYZd
   sk21FmViC0akXheGoOwxTqU1PuzyV7TsPP5jIVWxwkifGfNXlsHnpE+v2
   9ARiiZy6ZvntCSdJFs/P7gtzCX/amPrTZ3d6YNoA02jvYy1CvqCvaEZ96
   RGZv51DMP87wUTZsPxsmU7JjEM7jOkSpC5rGtIoDa6brLFB3SK7rMhfce
   Q==;
X-CSE-ConnectionGUID: dAahLSxvQDepYk/h9AX4HQ==
X-CSE-MsgGUID: WN8YtKxLQJWGE8siMxXFeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31454601"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="31454601"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 03:15:29 -0700
X-CSE-ConnectionGUID: lAPpoOR8RMOrRPO3uci+qA==
X-CSE-MsgGUID: ESNBILciQRq5t1KNndMNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="27568431"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2024 03:15:28 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxOnd-0007Uu-1h;
	Thu, 18 Apr 2024 10:15:25 +0000
Date: Thu, 18 Apr 2024 18:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 153/159]
 fs/bcachefs/btree_trans_commit.o: warning: objtool:
 do_bch2_trans_commit.isra.24() falls through to next function
 bch2_btree_add_journal_pin()
Message-ID: <202404181828.yxgEyhLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   b140fd9e47b4e1ddeacd5c1f8f35e4e54a9aa9d6
commit: b98ccc7ac87da3a792b6170a251b6156e4cf6927 [153/159] bcachefs: bch2_trans_verify_not_unlocked()
config: x86_64-randconfig-101-20240417 (https://download.01.org/0day-ci/archive/20240418/202404181828.yxgEyhLk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404181828.yxgEyhLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404181828.yxgEyhLk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_trans_commit.o: warning: objtool: do_bch2_trans_commit.isra.24() falls through to next function bch2_btree_add_journal_pin()
--
>> fs/bcachefs/btree_update.o: warning: objtool: bch2_trans_update_get_key_cache() falls through to next function btree_insert_entry_cmp()
   fs/bcachefs/btree_update.o: warning: objtool: flush_new_cached_update() falls through to next function bch2_trans_update_by_path()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
