Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2102524F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677240124; x=1708776124;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=AtwMCvh4adzdy/DtRlFRYhRJhuViIBUEfhbk4HwVsIc=;
  b=nu0Riv4vpIszenA9AjhEovQ/csw54Z1sjMHKE3Rhz/8gYlJwNN7k/bDU
   engVYpty6sskGuCcUAtmTns7bbcqrR38eM44gDv03zMY3D010t3uHYPlQ
   iiZqh4sPdATue5i78dpO95lMpp8AbZbO4siVucoSukKfEia0tluqU+Jik
   e3sSSy5oDSLwVehRiJanoGP16v81qYc4+UIZP35hrULLirgP7O5sod/tG
   U1glb/F6vSQblxKPPP7eyyn4ApDX6dDAjVPq+frBO3RduV7kGqP34cCog
   faYlRkik+m6/Y5zZyLIq27ZGBMoWXO54c4ul+YXfA70jAJyUzYtsApqBI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="333463241"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="333463241"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 04:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782333079"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="782333079"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 04:01:49 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVWlp-0002OL-0Q;
	Fri, 24 Feb 2023 12:01:49 +0000
Date: Fri, 24 Feb 2023 20:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] bluetooth: btbcm: Fix logic error in forming the board
 name.
Message-ID: <Y/inCHH6ezQcqY/4@f839a3c1ca0d>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-btbcm-wtf-v1-1-be717d728e56@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] bluetooth: btbcm: Fix logic error in forming the board name.
Link: https://lore.kernel.org/stable/20230224-btbcm-wtf-v1-1-be717d728e56%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



