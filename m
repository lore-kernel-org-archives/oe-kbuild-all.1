Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8E1E5B9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754831; cv=none; b=DC10VuGm9VC29fi8bFk80fEqA6OOpI6RKLAI6fR/VsTzjvOhkDg2ujKxjUsOfI1N/+UasuGdZzc3ymFPZYlHJJINJNiUWhCOzyqDS9ikEAIIUfRYRRCTlpcm/W0kV/mKNlBDsF3Sb44eulXUY5INue0rfKdxuOA7hmxR0KEBYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754831; c=relaxed/simple;
	bh=/3NvOfT9YBqmmF39tNTL9y47Bta412zWPOBIrygGStE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ni9L5my+rRbJwXpOFv/nd+salXa7ibaG25HKEiOjlXgk6ZJK9N/GvMgqcV5WHPQv3lKjYRYRJjmgdxplm//ApiNjwypIa/S+UKEcLnymkYXBnH7QTx/swBWwaM3hQyGg+z+YnpOFtZ6Z5tnTjtCk1ozU/xMhDWguUEsnX76sba8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeaUr+MH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeaUr+MH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786754829; x=1818290829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/3NvOfT9YBqmmF39tNTL9y47Bta412zWPOBIrygGStE=;
  b=MeaUr+MHxx+JaaqQ+auPDmcP2zTzeu5OJ5FFSSMgUxeq+3jwUeDlunzU
   cdTQGg8H31FGvTnE+Bizkmn3pBB9rA/D8KZxL3EUJNTo08lf1TvWksYNX
   zSrmj+KgqfUgKAxaKP9gYNfLTN3MyZDdhOnDPM4LB/LYn9+qqYGTiPG/P
   HxxM67NhhNzkx4QCaiDR1mzAejhZee6zyz3q9XFlsETT0CMHQlKBl5UH4
   qDy29UcOWkMvS/EegNgG03d3SRcFiz1UFmEb5UoJXMiSYQy5s3urlv40A
   N1HkIu/ANC22mcbwz43JuR6Go0wsJwdzt/Lnzg8gSxmukBG+km6huiXMD
   Q==;
X-CSE-ConnectionGUID: w7Go4yMKSeSLURZWz8tVlw==
X-CSE-MsgGUID: RL1RJtieQGai+8g7qJHTxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97679149"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="97679149"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 17:47:07 -0700
X-CSE-ConnectionGUID: kkoEuz1RRtKIz4Vc+rGHzQ==
X-CSE-MsgGUID: KODvklGuTGqBTDd5MrWlYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="264402635"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2026 17:47:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv2YA-00000000afo-1rxm;
	Sat, 15 Aug 2026 00:47:02 +0000
Date: Sat, 15 Aug 2026 08:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yichong Chen <chenyichong@uniontech.com>,
	Chris Mason <chris.mason@fusionio.com>,
	David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Boris Burkov <boris@bur.io>,
	Matthew Wilcox <willy@infradead.org>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: Re: [PATCH] btrfs: remove verity Merkle folio from page cache on
 error
Message-ID: <202608150828.VDr6P7DT-lkp@intel.com>
References: <20260706053907.544337-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706053907.544337-1-chenyichong@uniontech.com>

Hi Yichong,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2-rc7]
[cannot apply to kdave/for-next next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yichong-Chen/btrfs-remove-verity-Merkle-folio-from-page-cache-on-error/20260813-080149
base:   linus/master
patch link:    https://lore.kernel.org/r/20260706053907.544337-1-chenyichong%40uniontech.com
patch subject: [PATCH] btrfs: remove verity Merkle folio from page cache on error
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260815/202608150828.VDr6P7DT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150828.VDr6P7DT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150828.VDr6P7DT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "filemap_remove_folio" [fs/btrfs/btrfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
