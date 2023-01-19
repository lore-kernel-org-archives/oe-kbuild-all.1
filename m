Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C2193
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 02:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674095977; x=1705631977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Hdifom+vjmj8bVA7OGmDBcPanpOSGWzyc6nuzaLKLM=;
  b=kgcfSGhDtUwZI/KjsWwnFPGTiHyKnl/KTUeUXKQyKLaLB4c3M/WYXsf7
   yEObp38HamVITVHsMtEjpEiWAP/dIzxWTeR3brpwdAg8/ltW8ckCTi1Fy
   G1+xAdWpmtBWzhTELJv1tkQQOv+gQ1lrBNwcLUak6BTCBTdKISREwUefv
   XvdihU5QWADJ33hAIcz0E+Epkpp9SFpSgsQfc9FViRBoPpmVoc+dhK7LM
   KkjieLHswTyMS7x36jve+VmrJnpXstb8oZWIKZdd0b9FrHpN9fSy89VaL
   uK9umzVp51Mmpiln5uth1uXFInYOzBhTfUWdPXNu5ogts0tWLjpdOT239
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327247909"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="327247909"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 18:39:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609907686"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609907686"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 18:39:32 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIKpq-0000yk-0Z;
	Thu, 19 Jan 2023 02:39:26 +0000
Date: Thu, 19 Jan 2023 10:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: Convert OMAP OHCI/EHCI bindings
 to schema
Message-ID: <202301191008.G3IXJXb5-lkp@intel.com>
References: <20230110-dt-usb-v2-3-926bc1260e51@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110-dt-usb-v2-3-926bc1260e51@kernel.org>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 1b929c02afd37871d5afb9d498426f83432e71c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/dt-bindings-usb-Remove-obsolete-brcm-bcm3384-usb-txt/20230119-030120
base:   1b929c02afd37871d5afb9d498426f83432e71c2
patch link:    https://lore.kernel.org/r/20230110-dt-usb-v2-3-926bc1260e51%40kernel.org
patch subject: [PATCH v2 3/5] dt-bindings: usb: Convert OMAP OHCI/EHCI bindings to schema
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/e7220b26de1a7fcd192feec481c1a90f7bf5c949
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Herring/dt-bindings-usb-Remove-obsolete-brcm-bcm3384-usb-txt/20230119-030120
        git checkout e7220b26de1a7fcd192feec481c1a90f7bf5c949
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/omap-usb-host.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/ehci-generic.yaml
>> Warning: Documentation/devicetree/bindings/mfd/omap-usb-host.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/ohci-generic.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
