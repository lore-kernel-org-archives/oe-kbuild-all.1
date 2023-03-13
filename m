Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817F2F21
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 16:39:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32DGIrVB067811;
	Mon, 13 Mar 2023 11:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678724333;
	bh=cRFiBOWla/aAlCkFCVQu9g5o8nozkVCDiJ8uZVaj4VI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Pn3D9p2+PYw9VcwIUQlkdcgHhxIq5x+mHd70DqOmPpPrwI5M+NFSAGCNbdK0wSFmc
	 YUFZ34y42/iO2xwtbzB0q83UYcuCZq/vB9NvD+1u6lKi6jo08+rGq9op8qAlb+KGey
	 7lO1+gKYZXkYvJ40dU82bPHQ9qV5RaFr0awDUWek=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32DGIrwe021494
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Mar 2023 11:18:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Mar 2023 11:18:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 13 Mar 2023 11:18:52 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32DGIqui038454;
	Mon, 13 Mar 2023 11:18:52 -0500
Date: Mon, 13 Mar 2023 11:18:52 -0500
From: Nishanth Menon <nm@ti.com>
To: kernel test robot <lkp@intel.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, <oe-kbuild-all@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Julien Panis <jpanis@baylibre.com>, Bryan Brattlof <bb@ti.com>,
        Jason Kridner <jkridner@gmail.com>,
        Robert Nelson
	<robertcnelson@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: ti: Add k3-am625-beagleplay
Message-ID: <20230313161852.sj5oovnptgjiderj@galore>
References: <20230311111022.23717-3-nm@ti.com>
 <202303120702.ccWtDwJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202303120702.ccWtDwJU-lkp@intel.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 07:25-20230312, kernel test robot wrote:
> Hi Nishanth,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on krzk/for-next krzk-mem-ctrl/for-next linus/master v6.3-rc1 next-20230310]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Nishanth-Menon/dt-bindings-arm-ti-Add-bindings-for-BeaglePlay/20230311-191215
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20230311111022.23717-3-nm%40ti.com
> patch subject: [PATCH 2/3] arm64: dts: ti: Add k3-am625-beagleplay
> config: arm64-randconfig-r011-20230312 (https://download.01.org/0day-ci/archive/20230312/202303120702.ccWtDwJU-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/95427154e987290b162289c090d9e12ac9a71d9e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Nishanth-Menon/dt-bindings-arm-ti-Add-bindings-for-BeaglePlay/20230311-191215
>         git checkout 95427154e987290b162289c090d9e12ac9a71d9e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303120702.ccWtDwJU-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: Input tree has errors, aborting (use -f to force output)

Thanks for catching, this is the wkup_rtc0 node introduced in [1]. I
should have mentioned the same in the dependency, but slipped :(

[1] https://lore.kernel.org/all/20230311105850.21811-2-nm@ti.com/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
