Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF021D3CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 15:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755878087; cv=none; b=CStfnAjHU2AJcTuPtGlHqn10QLJo0e2cA7BShE5ZGmEBYzEdwcyT9aCQcCfID8bo1JBd3jt7bCQbj4EJut7Bg8aIJUYiZIJvep+lRvfBENOF/o/sClwibMZ8JJdY7murZoBD6Ox1Dz41j7TiO01c6jV7Bs1BLQyrZAdZVc05WyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755878087; c=relaxed/simple;
	bh=kQaQm/70b3+XiaHH/TaKGGYE4bbixHT2VLcIr3PjTFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iP9qCPTxde0Tb5jRFxJoJRPM5Y+V22sQ19H2RbU9TQVKHmEcB4+gwqeSX3WPNuawXYu/ICUR3iTJm+UktqgR+VBT87/Upcyp7lYh25GqoSKO4sNRrjDW4OMiETD4sAnhPJ0qnyVNd/nOKEr1GvwW/78P69J7TKPlL+5nFcBv7bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaSBFpUA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaSBFpUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755878086; x=1787414086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQaQm/70b3+XiaHH/TaKGGYE4bbixHT2VLcIr3PjTFM=;
  b=ZaSBFpUAnbY5QYzN0i9LkdELUAGJEe1g8yHOWJIfbpLLl0mG8/TEzbLE
   vRYt7P5eioCFcj0CMgLCkm5LjKn70Vtam1/j0KXmXwXyyW8Wr9B9uEp4P
   BLCZofEy+76UONGweJvPszbxhp6bEvdZS18jD3/q7M9Yxpm4vE1a846kN
   bpOa4hfD3kNNVG/eer7AvCIfNpivQq0pyCIGxT+qPluUfQ2duXS++wGmA
   7Eu0edoAe9BMaCb1qeLcuLNloJA2BBMA6ezbJoXfHM+XlniIID3+g5BZx
   rsvFzZPupe4rTifE2jLjaMGREyDmC81pLevrYCj3eQsDXWZgsvHyCoLLv
   Q==;
X-CSE-ConnectionGUID: dHVRDVxeQ5SSNdkZou13SA==
X-CSE-MsgGUID: b6mKy++FQRyShH1r3XKWig==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75772694"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75772694"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 08:54:45 -0700
X-CSE-ConnectionGUID: H528k5WfRiGRuvqB52S5dg==
X-CSE-MsgGUID: kOjHBEtRR+iD5Lks83yskw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199620287"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Aug 2025 08:54:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upU6D-000LUp-1H;
	Fri, 22 Aug 2025 15:54:41 +0000
Date: Fri, 22 Aug 2025 23:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/16] VFS: implement simple_start_creating() with
 start_dirop()
Message-ID: <202508222345.5v3e0cLo-lkp@intel.com>
References: <20250822000818.1086550-9-neil@brown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822000818.1086550-9-neil@brown.name>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on trondmy-nfs/linux-next linus/master v6.17-rc2 next-20250822]
[cannot apply to tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-discard-err2-in-filename_create/20250822-081444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250822000818.1086550-9-neil%40brown.name
patch subject: [PATCH v2 08/16] VFS: implement simple_start_creating() with start_dirop()
config: sh-randconfig-r073-20250822 (https://download.01.org/0day-ci/archive/20250822/202508222345.5v3e0cLo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508222345.5v3e0cLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508222345.5v3e0cLo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/libfs.c:2303 function parameter 'parent' not described in 'simple_start_creating'
>> Warning: fs/libfs.c:2303 function parameter 'name' not described in 'simple_start_creating'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
