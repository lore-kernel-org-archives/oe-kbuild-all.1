Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793673C39
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 16:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680365015; x=1711901015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3q+4bdll1iIv2OgcqGTOPE8Q06kXznsMI9EQOKIohk=;
  b=TJonmJAjCj4pnsmB3vSiVSdUwz5loIssgyZ+BN/7QVRT6ELH3DkvEN1r
   q50jAlzLz+ww7WXnCAMSpXUCQ/cPT86XyOAb16ajbqtRyNTHsA6zqi3LD
   EQUFmjmkUUZNhGl4BG6/lOCGzLzbyiYHUcBoH+JCi037G6JF8+61Ct5eu
   EIG0aw02TqkYq08VYynaQ3A+ERBehRy3o0k/jlquDdJRC0va/k0YZXdOW
   SA/hwtphOu1NbG3evFloEEHafg4WmO4FY3EKbOFUCRwT/95EqwV9f8W88
   jjMPIoJM2zzECT4jk74HFGxlFXv8sWxZZYdpSOjvJmm44Vkx3sosuwbXy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="322055504"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="322055504"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 09:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="1015185701"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="1015185701"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2023 09:03:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pidhU-000Mtp-32;
	Sat, 01 Apr 2023 16:03:32 +0000
Date: Sun, 2 Apr 2023 00:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hansg:media-atomisp 2/39]
 drivers/staging/media/atomisp/pci/atomisp_cmd.c:1918:38: warning: variable
 'stream_cfg' set but not used
Message-ID: <202304012332.JIEQ8CW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git media-atomisp
head:   c62b31fa94c3e4477ea0ed3f5a114f01ad73b7e9
commit: 9872024269c343b01e6b719fee6fba78cab2a842 [2/39] media: atomisp: Remove continuous mode support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230401/202304012332.JIEQ8CW0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?id=9872024269c343b01e6b719fee6fba78cab2a842
        git remote add hansg https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git
        git fetch --no-tags hansg media-atomisp
        git checkout 9872024269c343b01e6b719fee6fba78cab2a842
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/media/atomisp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304012332.JIEQ8CW0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'atomisp_get_dvs2_bq_resolutions':
>> drivers/staging/media/atomisp/pci/atomisp_cmd.c:1918:38: warning: variable 'stream_cfg' set but not used [-Wunused-but-set-variable]
    1918 |         struct ia_css_stream_config *stream_cfg = NULL;
         |                                      ^~~~~~~~~~


vim +/stream_cfg +1918 drivers/staging/media/atomisp/pci/atomisp_cmd.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1910  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1911  /*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1912   * Function to get DVS2 BQ resolution settings
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1913   */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1914  int atomisp_get_dvs2_bq_resolutions(struct atomisp_sub_device *asd,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1915  				    struct atomisp_dvs2_bq_resolutions *bq_res)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1916  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1917  	struct ia_css_pipe_config *pipe_cfg = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19 @1918  	struct ia_css_stream_config *stream_cfg = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1919  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1920  	struct ia_css_stream *stream =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1921  		    asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1922  	if (!stream) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1923  		dev_warn(asd->isp->dev, "stream is not created");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1924  		return -EAGAIN;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1925  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1926  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1927  	pipe_cfg = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
c01d5546773e3a drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2020-05-21  1928  		   .pipe_configs[IA_CSS_PIPE_ID_VIDEO];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1929  	stream_cfg = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1930  		     .stream_config;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1931  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1932  	if (!bq_res)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1933  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1934  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1935  	/* the GDC output resolution */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1936  	bq_res->output_bq.width_bq = pipe_cfg->output_info[0].res.width / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1937  	bq_res->output_bq.height_bq = pipe_cfg->output_info[0].res.height / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1938  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1939  	bq_res->envelope_bq.width_bq = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1940  	bq_res->envelope_bq.height_bq = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1941  	/* the GDC input resolution */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1942  	bq_res->source_bq.width_bq = bq_res->output_bq.width_bq +
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1943  				     pipe_cfg->dvs_envelope.width / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1944  	bq_res->source_bq.height_bq = bq_res->output_bq.height_bq +
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1945  				      pipe_cfg->dvs_envelope.height / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1946  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1947  	 * Bad pixels caused by spatial filter processing
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1948  	 * ISP filter resolution should be given by CSS/FW, but for now
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1949  	 * there is not such API to query, and it is fixed value, so
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1950  	 * hardcoded here.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1951  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1952  	bq_res->ispfilter_bq.width_bq = 12 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1953  	bq_res->ispfilter_bq.height_bq = 12 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1954  	/* spatial filter shift, always 4 pixels */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1955  	bq_res->gdc_shift_bq.width_bq = 4 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1956  	bq_res->gdc_shift_bq.height_bq = 4 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1957  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1958  	if (asd->params.video_dis_en) {
9872024269c343 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-02-21  1959  		bq_res->envelope_bq.width_bq = pipe_cfg->dvs_envelope.width / 2 -
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1960  					       bq_res->ispfilter_bq.width_bq;
9872024269c343 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-02-21  1961  		bq_res->envelope_bq.height_bq = pipe_cfg->dvs_envelope.height / 2 -
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1962  						bq_res->ispfilter_bq.height_bq;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1963  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1964  
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1965  	dev_dbg(asd->isp->dev,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1966  		"source_bq.width_bq %d, source_bq.height_bq %d,\nispfilter_bq.width_bq %d, ispfilter_bq.height_bq %d,\ngdc_shift_bq.width_bq %d, gdc_shift_bq.height_bq %d,\nenvelope_bq.width_bq %d, envelope_bq.height_bq %d,\noutput_bq.width_bq %d, output_bq.height_bq %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1967  		bq_res->source_bq.width_bq, bq_res->source_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1968  		bq_res->ispfilter_bq.width_bq, bq_res->ispfilter_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1969  		bq_res->gdc_shift_bq.width_bq, bq_res->gdc_shift_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1970  		bq_res->envelope_bq.width_bq, bq_res->envelope_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1971  		bq_res->output_bq.width_bq, bq_res->output_bq.height_bq);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1972  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1973  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1974  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1975  

:::::: The code at line 1918 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
