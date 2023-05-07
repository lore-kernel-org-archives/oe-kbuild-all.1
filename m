Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2190215AF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 01:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683423032; x=1714959032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FIrZiayXiglnGHTRWgoTjb29nAt02JSHA3Qb5CdPV7c=;
  b=G0cclg31iVgoC7RCtCJv9+qz9d3j/VEQ1ZWvPF6fERA9AyMDMk9HsvO3
   K8mVdkM1w+ji8Ca0CIs03ThpxXiSRBZUIe66xyOXjCDG8UAj3hc+ZkYK3
   frTmw99gMCP0h3kHujtYXJQQzg0TKJ7oJWS5AgZ9820SvWZishZr7nXgC
   UD2hbDQCxh+Ra0u093sUoRW8w5+R5MlD4crYGTvo0P0M+mIaCscdVCqE8
   YBlEFPxF1aPbpFigvfuzy8jgGp7r6zczoIP2ZgPw3nzaiWLVHMs1y9trD
   fw499zQshHICIy89HPxLH+bxm8VbS2vIRoe7MdKl6VInQ2qgjYKetyrS5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="348259151"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="348259151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 18:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="675615776"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="675615776"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 May 2023 18:30:25 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvTEH-0000YH-04;
	Sun, 07 May 2023 01:30:25 +0000
Date: Sun, 7 May 2023 09:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: alison@she-devel.com, johan@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alison@she-devel.com, achaiken@aurora.tech
Subject: Re: [PATCH v3 1/2] gnss: ubx: customize serial device open to set
 U-Blox Zed-F9P baud
Message-ID: <202305070938.8vWQFfIQ-lkp@intel.com>
References: <20230506225849.2752103-2-alison@she-devel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230506225849.2752103-2-alison@she-devel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-she-devel-com/dt-bindings-gnss-Add-U-Blox-Zed-F9/20230507-075854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230506225849.2752103-2-alison%40she-devel.com
patch subject: [PATCH v3 1/2] gnss: ubx: customize serial device open to set U-Blox Zed-F9P baud
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230507/202305070938.8vWQFfIQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/637fad08b78d20ec3f1c07e6e37dc97f85eac7b9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alison-she-devel-com/dt-bindings-gnss-Add-U-Blox-Zed-F9/20230507-075854
        git checkout 637fad08b78d20ec3f1c07e6e37dc97f85eac7b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070938.8vWQFfIQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gnss/ubx.c: In function 'ubx_probe':
>> drivers/gnss/ubx.c:303:42: error: 'ubx_of_match' undeclared (first use in this function)
     303 |         data->features = of_match_device(ubx_of_match, &serdev->dev)->data;
         |                                          ^~~~~~~~~~~~
   drivers/gnss/ubx.c:303:42: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   drivers/gnss/ubx.c:176:12: warning: 'zed_f9p_serial_open' defined but not used [-Wunused-function]
     176 | static int zed_f9p_serial_open(struct gnss_device *gdev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/ubx_of_match +303 drivers/gnss/ubx.c

   278	
   279	static int ubx_probe(struct serdev_device *serdev)
   280	{
   281		struct gnss_serial *gserial;
   282		struct ubx_data *data;
   283		struct gnss_operations *ubx_gnss_ops;
   284		int ret;
   285	
   286		gserial = gnss_serial_allocate(serdev, sizeof(*data));
   287		if (IS_ERR(gserial)) {
   288			ret = PTR_ERR(gserial);
   289			return ret;
   290		}
   291		ubx_gnss_ops = kzalloc(sizeof(struct gnss_operations), GFP_KERNEL);
   292		if (IS_ERR(ubx_gnss_ops)) {
   293			ret = PTR_ERR(ubx_gnss_ops);
   294			return ret;
   295		}
   296	
   297		gserial->ops = &ubx_gserial_ops;
   298	
   299		gserial->gdev->type = GNSS_TYPE_UBX;
   300	
   301		data = gnss_serial_get_drvdata(gserial);
   302		data->is_configured = 0;
 > 303		data->features = of_match_device(ubx_of_match, &serdev->dev)->data;
   304		if (data->features && data->features->open) {
   305			ubx_gnss_ops->open  = data->features->open;
   306			ubx_gnss_ops->close = gserial->gdev->ops->close;
   307			ubx_gnss_ops->write_raw = gserial->gdev->ops->write_raw;
   308			gserial->gdev->ops = ubx_gnss_ops;
   309		}
   310	
   311		data->vcc = devm_regulator_get(&serdev->dev, "vcc");
   312		if (IS_ERR(data->vcc)) {
   313			ret = PTR_ERR(data->vcc);
   314			goto err_free_gserial;
   315		}
   316	
   317		data->v_bckp = devm_regulator_get_optional(&serdev->dev, "v-bckp");
   318		if (IS_ERR(data->v_bckp)) {
   319			ret = PTR_ERR(data->v_bckp);
   320			if (ret == -ENODEV)
   321				data->v_bckp = NULL;
   322			else
   323				goto err_free_gserial;
   324		}
   325	
   326		if (data->v_bckp) {
   327			ret = regulator_enable(data->v_bckp);
   328			if (ret)
   329				goto err_free_gserial;
   330		}
   331	
   332		ret = gnss_serial_register(gserial);
   333		if (ret)
   334			goto err_disable_v_bckp;
   335	
   336		return 0;
   337	
   338	err_disable_v_bckp:
   339		if (data->v_bckp)
   340			regulator_disable(data->v_bckp);
   341	err_free_gserial:
   342		gnss_serial_free(gserial);
   343	
   344		return ret;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
