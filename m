Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E401C28ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677166447; x=1708702447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QQngnPj0KYq88epAkjtpHhVWThg+EKfq84nRKBsT4I=;
  b=FbTjzUBN+YPmlWLiN+KdciP1botS8MNBi1LnV14bstOjN5kTzo6SP6th
   PC3hNK0c5vV6toDyfEz6kAutnFyvNdg+EBl38QisiO7krsXPUwbznRX8i
   Ol3mf4K7NAXTsA35ahQ1Qx78T5LaZwMPhzpq21vEiDHu6B+EV/eBHN0RM
   i3OWcwGiMH/E7GbmlMgX5BxTf3/GxibMKtAd67z/G+fhNSE0CeJB2kX7a
   axorV4JH2b8m6Io1t+MLhe+NohYYTQmcFZwPCKJeIeGhhCGRNvA8T5Z2z
   KpojpkYIZLRL9hDLpmiFP8af/un+ZO63qmVFscb5D/TC4ArST/EJ7E8z4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335469015"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="335469015"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 07:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="702827230"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="702827230"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2023 07:34:06 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVDbh-0001Qd-0n;
	Thu, 23 Feb 2023 15:34:05 +0000
Date: Thu, 23 Feb 2023 23:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org
Subject: htmldocs: Warning:
 Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file
 that doesn't exist:
 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
Message-ID: <202302232316.L6gzJade-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5c95ca18a98d742d0a4a04063c32556b5b66378
commit: 0f48b0ed356d8868f62f7c6814fc2edcd70d1816 dt-bindings: phy: rename phy-rockchip-inno-usb2.yaml
date:   3 weeks ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0f48b0ed356d8868f62f7c6814fc2edcd70d1816
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0f48b0ed356d8868f62f7c6814fc2edcd70d1816
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302232316.L6gzJade-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
