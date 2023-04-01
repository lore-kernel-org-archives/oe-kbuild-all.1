Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58F3232
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680354449; x=1711890449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsjZQi0h/Kc+JqhB2HE256ScfxyjfsNniB5/3n78zEM=;
  b=nYShxlZkobkjHzNe1IMZmhkeoUCWqU4Ztf68jiaggbFAxIZgx3w91icw
   s9Kpio4YreGy0O37a9sRqEfyQPs4PrKHJ9aGyIacNEx7ZH3hYCxaB4tFo
   5iUy8pbg+6osL5HAXcM+hHGxFFBKEjXdW0DqEm8BYS0om9B5/ImidpZxP
   GFaaYGyTM0yYASiAlAztwHHfm6rEMFbRj7k61LJldDAeeiErn72wSGrww
   vQUYQiIgGP7WG6IGInsI7J2WMHmEavFYGBGD8C1l5XNuvBa0A6I5M/Ag7
   +P7hdVDDGQSsUlTd0xIh6Nz9D63GE9RHdQrRG5EpYXPastokzyVLEq7Gk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="330209043"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="330209043"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 06:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="715754506"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="715754506"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Apr 2023 06:07:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piax5-000Mmj-05;
	Sat, 01 Apr 2023 13:07:27 +0000
Date: Sat, 1 Apr 2023 21:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hansg:media-atomisp 2/10]
 drivers/staging/media/atomisp/pci/atomisp_cmd.c:1919:44: warning: variable
 'input_config' set but not used
Message-ID: <202304012049.ekJGI66F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git media-atomisp
head:   82cb97e500ae0325491986aadf2d873d1429e512
commit: ea525d780d224ea630b43041a17ec7702cd18f12 [2/10] media: atomisp: Remove continuous mode support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230401/202304012049.ekJGI66F-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?id=ea525d780d224ea630b43041a17ec7702cd18f12
        git remote add hansg https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git
        git fetch --no-tags hansg media-atomisp
        git checkout ea525d780d224ea630b43041a17ec7702cd18f12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/media/atomisp/ lib/kunit/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304012049.ekJGI66F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'atomisp_get_dvs2_bq_resolutions':
>> drivers/staging/media/atomisp/pci/atomisp_cmd.c:1919:44: warning: variable 'input_config' set but not used [-Wunused-but-set-variable]
    1919 |         struct ia_css_stream_input_config *input_config = NULL;
         |                                            ^~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'atomisp_set_fmt':
>> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4673:36: warning: variable 'isp_sink_fmt' set but not used [-Wunused-but-set-variable]
    4673 |         struct v4l2_mbus_framefmt *isp_sink_fmt;
         |                                    ^~~~~~~~~~~~


vim +/input_config +1919 drivers/staging/media/atomisp/pci/atomisp_cmd.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1910  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1911  /*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1912   * Function to get DVS2 BQ resolution settings
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1913   */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1914  int atomisp_get_dvs2_bq_resolutions(struct atomisp_sub_device *asd,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1915  				    struct atomisp_dvs2_bq_resolutions *bq_res)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1916  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1917  	struct ia_css_pipe_config *pipe_cfg = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1918  	struct ia_css_stream_config *stream_cfg = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19 @1919  	struct ia_css_stream_input_config *input_config = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1920  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1921  	struct ia_css_stream *stream =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1922  		    asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1923  	if (!stream) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1924  		dev_warn(asd->isp->dev, "stream is not created");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1925  		return -EAGAIN;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1926  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1927  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1928  	pipe_cfg = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
c01d5546773e3a drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2020-05-21  1929  		   .pipe_configs[IA_CSS_PIPE_ID_VIDEO];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1930  	stream_cfg = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1931  		     .stream_config;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1932  	input_config = &stream_cfg->input_config;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1933  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1934  	if (!bq_res)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1935  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1936  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1937  	/* the GDC output resolution */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1938  	bq_res->output_bq.width_bq = pipe_cfg->output_info[0].res.width / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1939  	bq_res->output_bq.height_bq = pipe_cfg->output_info[0].res.height / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1940  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1941  	bq_res->envelope_bq.width_bq = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1942  	bq_res->envelope_bq.height_bq = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1943  	/* the GDC input resolution */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1944  	bq_res->source_bq.width_bq = bq_res->output_bq.width_bq +
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1945  				     pipe_cfg->dvs_envelope.width / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1946  	bq_res->source_bq.height_bq = bq_res->output_bq.height_bq +
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1947  				      pipe_cfg->dvs_envelope.height / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1948  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1949  	 * Bad pixels caused by spatial filter processing
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1950  	 * ISP filter resolution should be given by CSS/FW, but for now
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1951  	 * there is not such API to query, and it is fixed value, so
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1952  	 * hardcoded here.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1953  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1954  	bq_res->ispfilter_bq.width_bq = 12 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1955  	bq_res->ispfilter_bq.height_bq = 12 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1956  	/* spatial filter shift, always 4 pixels */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1957  	bq_res->gdc_shift_bq.width_bq = 4 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1958  	bq_res->gdc_shift_bq.height_bq = 4 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1959  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1960  	if (asd->params.video_dis_en) {
ea525d780d224e drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-02-21  1961  		bq_res->envelope_bq.width_bq = pipe_cfg->dvs_envelope.width / 2 -
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1962  					       bq_res->ispfilter_bq.width_bq;
ea525d780d224e drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-02-21  1963  		bq_res->envelope_bq.height_bq = pipe_cfg->dvs_envelope.height / 2 -
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1964  						bq_res->ispfilter_bq.height_bq;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1965  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1966  
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1967  	dev_dbg(asd->isp->dev,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1968  		"source_bq.width_bq %d, source_bq.height_bq %d,\nispfilter_bq.width_bq %d, ispfilter_bq.height_bq %d,\ngdc_shift_bq.width_bq %d, gdc_shift_bq.height_bq %d,\nenvelope_bq.width_bq %d, envelope_bq.height_bq %d,\noutput_bq.width_bq %d, output_bq.height_bq %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1969  		bq_res->source_bq.width_bq, bq_res->source_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1970  		bq_res->ispfilter_bq.width_bq, bq_res->ispfilter_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1971  		bq_res->gdc_shift_bq.width_bq, bq_res->gdc_shift_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1972  		bq_res->envelope_bq.width_bq, bq_res->envelope_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1973  		bq_res->output_bq.width_bq, bq_res->output_bq.height_bq);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1974  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1975  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1976  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1977  

:::::: The code at line 1919 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
