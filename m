Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751E18C16
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690814492; x=1722350492;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nS0HdeQOiH4dmoeESh3uoO/rKMus+p58YCjgIzfObDc=;
  b=VfrQjxNdmHhPurAKlGLK9cGnh6AOOn/simtTZdipvCBvVGRdPW13biqC
   hWpoqxqNYfxYW7gO1+7hbXfTyhEa8Ju1XYEhXwhHljYbb9A9a1wSmEdCF
   UVJAvRfEdr3o7mZLshm85OdKdM6nUf0eATPpjKdDm9FGUWK2X76Vx2ZwW
   poEOqO7m7eiXTG/hINmnJx35NYGiOcIhaNuqvxJD5/UWJ52ZbQaEF23b5
   pi1BTA59gA3KomjjiORtK3N3vJKPLa05vP4grg1Se5uovl0ZD2Jl2LYwu
   SCgHNkliancAHLlQxMlV114kMFo+xns92Q5Tiwzvme7iNAm5l2VXaVILr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371742655"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371742655"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 07:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798252272"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="798252272"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jul 2023 07:41:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQU5B-0005Af-1P;
	Mon, 31 Jul 2023 14:41:17 +0000
Date: Mon, 31 Jul 2023 22:39:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 82/107] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/cnm,wave5.yaml
Message-ID: <202307312205.gjgGSxTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   607bd344fe026c652150d4af0aa1e922b06585ee
commit: ac2b9636c2e0a1c48d9058b58c3e399a571ea240 [82/107] media: chips-media: wave5: Add wave5 driver to maintainers file
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307312205.gjgGSxTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307312205.gjgGSxTE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/cnm,wave5.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
