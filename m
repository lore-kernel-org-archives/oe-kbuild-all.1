Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2549CA6C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 03:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUjA9duu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696649567; x=1728185567;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=WUqeZc/H1BQgiqffNeWMm0UbIPCoEHACpAqSGtLnBX8=;
  b=gUjA9duuJImMEDmfUHY45IOCNQ5L82kJI3LxMtOFw1qDL7CEz/yhH/Yk
   2Sr5S0r4CjbPLrQebtoQdW152RyjzisM2oHQDKkw2shbSrcaUTGz7Yv/W
   6xWaQeXwaRM9s59mIlPVS8fYZ2DSArqiblRvBtrjkQatxBopT9Z1SgRKH
   HJmIXprlOXi0rbuK+TJlMQ7G96zZ3RPM320Rts7r+GcHzgfgI/Cyw2ZGH
   /b8dfh/lUg1X8BSKL7dn0R38bq1yu6SNv0DpL4oCF1G5AYXNHdvNNouJi
   yFe8GSmGZu4bM6SZabNm17jwkGgkPep53TsEeJYniggVAEgrKpiwnBLoC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="364169571"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="364169571"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 20:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="752390894"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="752390894"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Oct 2023 20:32:43 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoy3V-0003vn-28;
	Sat, 07 Oct 2023 03:32:41 +0000
Date: Sat, 7 Oct 2023 11:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [v4] ieee802154: ca8210: Fix a potential UAF in
 ca8210_probe
Message-ID: <ZSDRV9ZW/5GgJuW8@ded96c82e756>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007033049.22353-1-dinghao.liu@zju.edu.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] [v4] ieee802154: ca8210: Fix a potential UAF in ca8210_probe
Link: https://lore.kernel.org/stable/20231007033049.22353-1-dinghao.liu%40zju.edu.cn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



