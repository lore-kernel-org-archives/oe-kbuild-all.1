Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703EA954
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688723278; x=1720259278;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=oPd2nUTKWXb/GYrlGNmOZJgr4Xb6z3uaDAKVz3gKDxU=;
  b=j9EWBTzrEaj5zRhDJWeaKoMuSevcnuW1arnO4AP5GE0TKS6UP6Le4naJ
   u+0Y9IkHXrb4upMzMnsEimzA07VsPLIHVrHJd8m/db7yl0NzC5ggNKzJR
   wMS3tX67/mnRsaS43iKwOUZZKeSZs9a6mVSA87En5h+TUU+stlYV7IOGV
   gs0BM2mlNBSpbnwW6DneXC9FlLrM3mt4TVF3PocXM1BhGmT+WY9DIFUfX
   PUlLJr1oNMArvnL627YCTveswCDg+XMNjwnelRUv7/FNaYfFdMD56Pky+
   f1x9oIi9fszYeSRmS3RBUdtjMhnz7aMJShFVfCwT/DbF/piWbfbo0GZdi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427536985"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="427536985"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 02:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="723169223"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="723169223"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jul 2023 02:47:56 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHi4B-0001va-1S;
	Fri, 07 Jul 2023 09:47:55 +0000
Date: Fri, 7 Jul 2023 17:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 net] net: mana: Configure hwc timeout from hardware
Message-ID: <ZKffK1iEYX3xo3jy@a1daa7802ad8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688723128-14878-1-git-send-email-schakrabarti@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH V2 net] net: mana: Configure hwc timeout from hardware
Link: https://lore.kernel.org/stable/1688723128-14878-1-git-send-email-schakrabarti%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



