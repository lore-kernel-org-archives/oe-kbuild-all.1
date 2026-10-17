Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11651374721
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 04:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212717; cv=none; b=uguqR2AmJqbSqDWdSEjktAyBya5GzMn0Y373KtI0orUKiP5wdjGb5KcA2YbZr47soizd5sAiovoJmVOzBB0qQG0J6BN4HxZH8jpz0Rk4E6mxMOhkUwzuKyI0c/AT4kxUCXMP2iS91c9Y+hswsao3xgm2aAhFoBmRD4Phfqs9DXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212717; c=relaxed/simple;
	bh=R+8i4LI6E93ty/u9IagDtyMHz+62Q1ZdKBGKtZ47+M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWEDXXUZ0YK2RnJsfWPyyACrQQbGr1P6a6EtfhfHbLh/ASV2AhVcb82rzyfZDxUxHqA2Z2vmeHs1D02VnWosSc/n/MZB7qERZrtwPh/bQ1xfd77+I/6L6GqPYiKDcj+RxCmiU/byJ6IoXxKe05+IEyPbA0o//aGs/fv24itgEfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIaLFhAT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIaLFhAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792212715; x=1823748715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R+8i4LI6E93ty/u9IagDtyMHz+62Q1ZdKBGKtZ47+M8=;
  b=UIaLFhAT7yY6SB3QaPHYK4T92R5YQzgqugmqqrUmlUljueEwk8/a3oqL
   w4W0DV2LpvhCfvfFMeIJNh/Fjr8In1CefImulyQvNYRBCso0V29PfLezX
   jAY+WpXw4L7fymUUQE5Oxvo9G8HxJpj9uhf6PF3km6T6ahzP6k/jtYyuM
   bPGCElNc/L9SVCzWGu7f4kGjf9neJDyoxr4fBpylXvMPj/Yst4S4nc+RL
   cJoLESa9/23o6jgfupsRKun8PkPuuFbOiF1/tlBpffinI47diifdjUXJd
   feYqqmsRqPjehApgpoEvWDm8tnm3dJ1FPE8SqiR8D7YWO1KZ4LOCbRtIJ
   w==;
X-CSE-ConnectionGUID: UoaO48ClSwa/Ql6ckMelqQ==
X-CSE-MsgGUID: iDWTn4K7QEu/3HkZzdOA8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="892839"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="892839"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 21:51:55 -0700
X-CSE-ConnectionGUID: M1VqWDyyQnmNoMYKGuSGCA==
X-CSE-MsgGUID: XdJDyz57R7+p3MAdKWHQWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2018010"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Oct 2026 21:51:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHwOc-00000000J5S-1f4l;
	Sat, 17 Oct 2026 04:51:50 +0000
Date: Sat, 17 Oct 2026 12:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>, ceph-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alex Markuze <amarkuze@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubo.li@clyso.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ceph: record subvolume quarantine from MDS cap
 updates
Message-ID: <202610171220.i77KPiw5-lkp@intel.com>
References: <3e9b7bcfa68bd2f6bf6917f608254570a0769a12.1792074165.git.amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e9b7bcfa68bd2f6bf6917f608254570a0769a12.1792074165.git.amarkuze@redhat.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on ed0502cb11f84fff29f374238e526ae94d9bdfde]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Markuze/ceph-add-subvolume-quarantine-wire-definitions/20261015-161202
base:   ed0502cb11f84fff29f374238e526ae94d9bdfde
patch link:    https://lore.kernel.org/r/3e9b7bcfa68bd2f6bf6917f608254570a0769a12.1792074165.git.amarkuze%40redhat.com
patch subject: [PATCH v2 2/3] ceph: record subvolume quarantine from MDS cap updates
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261017/202610171220.i77KPiw5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171220.i77KPiw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171220.i77KPiw5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/ceph/ceph.ko: symbol 'd_find_alias_rcu' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
