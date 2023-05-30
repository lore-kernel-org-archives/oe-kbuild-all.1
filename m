Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BC49474
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 20:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685480267; x=1717016267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifICqhkYrs5BBYuxQAeZFuJBTNlMxJ35SdSVuH06Zfw=;
  b=fUin+/FFZAOGA9po5bSUlYe0U39hLthv8GH7G723dxAyYsIbmcdDNMAY
   +n2l3qzl/MAVRT/lrHoCgiAs5e4bj/xdOKUXZ06BCzAc1oQz8sZFN3Wma
   K1Ku/OiMWeDER8PBNST8i3Ckk7/DPpsBGxnqohKCQGoHzI1T/rcyWGuBZ
   nVOp6dVrHGowslKlW/TKla8XzNiV8kxE9cG/921/1VD4GEVmHgEBNAR8X
   utROm7uRNiBdWO8B1E/YBrUN6RIpVR+PLSxVqLQJxPpWyxt5glAzlZhjS
   evLAFgMD8IpO8mlZP7Z1vYw+ILTPYesn0IMzGDZKwHQ9bWAMobS4lCiHf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383306524"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="383306524"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 13:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="706588481"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="706588481"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2023 13:57:43 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q46PX-0000o8-2P;
	Tue, 30 May 2023 20:57:43 +0000
Date: Wed, 31 May 2023 04:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [hansg:media-atomisp 64/78]
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1766:29: warning: variable
 'motor' set but not used
Message-ID: <202305310436.hs8U9xbF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git media-atomisp
head:   411cf9753f5a0f0e810ab155ba1e3698f2e76cf2
commit: b373643c38c2a04147d5285cfbd4c8573864c659 [64/78] media: atomisp: Remove a bunch of sensor related custom IOCTLs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230531/202305310436.hs8U9xbF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?id=b373643c38c2a04147d5285cfbd4c8573864c659
        git remote add hansg https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git
        git fetch --no-tags hansg media-atomisp
        git checkout b373643c38c2a04147d5285cfbd4c8573864c659
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/media/atomisp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310436.hs8U9xbF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_ioctl.c: In function 'atomisp_vidioc_default':
>> drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1766:29: warning: variable 'motor' set but not used [-Wunused-but-set-variable]
    1766 |         struct v4l2_subdev *motor;
         |                             ^~~~~


vim +/motor +1766 drivers/staging/media/atomisp/pci/atomisp_ioctl.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1759  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1760  static long atomisp_vidioc_default(struct file *file, void *fh,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1761  				   bool valid_prio, unsigned int cmd, void *arg)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1762  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1763  	struct video_device *vdev = video_devdata(file);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1764  	struct atomisp_device *isp = video_get_drvdata(vdev);
af69562a28faa5 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-08-28  1765  	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
9ace178dee1543 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-22 @1766  	struct v4l2_subdev *motor;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1767  	int err;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1768  
469a7306f1717b drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Mauro Carvalho Chehab 2020-06-01  1769  	if (!IS_ISP2401)
9ace178dee1543 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-22  1770  		motor = isp->inputs[asd->input_curr].motor;
9ace178dee1543 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-22  1771  	else
9ace178dee1543 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-22  1772  		motor = isp->motor;
9ace178dee1543 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-22  1773  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1774  	switch (cmd) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1775  	case ATOMISP_IOC_S_SENSOR_RUNMODE:
469a7306f1717b drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Mauro Carvalho Chehab 2020-06-01  1776  		if (IS_ISP2401)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1777  			err = atomisp_set_sensor_runmode(asd, arg);
9ace178dee1543 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-22  1778  		else
9ace178dee1543 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-22  1779  			err = -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1780  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1781  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1782  	case ATOMISP_IOC_G_XNR:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1783  		err = atomisp_xnr(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1784  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1785  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1786  	case ATOMISP_IOC_S_XNR:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1787  		err = atomisp_xnr(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1788  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1789  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1790  	case ATOMISP_IOC_G_NR:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1791  		err = atomisp_nr(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1792  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1793  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1794  	case ATOMISP_IOC_S_NR:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1795  		err = atomisp_nr(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1796  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1797  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1798  	case ATOMISP_IOC_G_TNR:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1799  		err = atomisp_tnr(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1800  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1801  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1802  	case ATOMISP_IOC_S_TNR:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1803  		err = atomisp_tnr(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1804  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1805  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1806  	case ATOMISP_IOC_G_BLACK_LEVEL_COMP:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1807  		err = atomisp_black_level(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1808  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1809  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1810  	case ATOMISP_IOC_S_BLACK_LEVEL_COMP:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1811  		err = atomisp_black_level(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1812  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1813  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1814  	case ATOMISP_IOC_G_EE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1815  		err = atomisp_ee(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1816  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1817  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1818  	case ATOMISP_IOC_S_EE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1819  		err = atomisp_ee(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1820  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1821  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1822  	case ATOMISP_IOC_G_DIS_STAT:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1823  		err = atomisp_get_dis_stat(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1824  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1825  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1826  	case ATOMISP_IOC_G_DVS2_BQ_RESOLUTIONS:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1827  		err = atomisp_get_dvs2_bq_resolutions(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1828  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1829  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1830  	case ATOMISP_IOC_S_DIS_COEFS:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1831  		err = atomisp_css_cp_dvs2_coefs(asd, arg,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1832  						&asd->params.css_param, true);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1833  		if (!err && arg)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1834  			asd->params.css_update_params_needed = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1835  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1836  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1837  	case ATOMISP_IOC_S_DIS_VECTOR:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1838  		err = atomisp_cp_dvs_6axis_config(asd, arg,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1839  						  &asd->params.css_param, true);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1840  		if (!err && arg)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1841  			asd->params.css_update_params_needed = true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1842  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1843  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1844  	case ATOMISP_IOC_G_ISP_PARM:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1845  		err = atomisp_param(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1846  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1847  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1848  	case ATOMISP_IOC_S_ISP_PARM:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1849  		err = atomisp_param(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1850  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1851  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1852  	case ATOMISP_IOC_G_3A_STAT:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1853  		err = atomisp_3a_stat(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1854  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1855  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1856  	case ATOMISP_IOC_G_ISP_GAMMA:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1857  		err = atomisp_gamma(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1858  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1859  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1860  	case ATOMISP_IOC_S_ISP_GAMMA:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1861  		err = atomisp_gamma(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1862  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1863  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1864  	case ATOMISP_IOC_G_ISP_GDC_TAB:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1865  		err = atomisp_gdc_cac_table(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1866  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1867  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1868  	case ATOMISP_IOC_S_ISP_GDC_TAB:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1869  		err = atomisp_gdc_cac_table(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1870  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1871  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1872  	case ATOMISP_IOC_G_ISP_MACC:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1873  		err = atomisp_macc_table(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1874  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1875  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1876  	case ATOMISP_IOC_S_ISP_MACC:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1877  		err = atomisp_macc_table(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1878  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1879  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1880  	case ATOMISP_IOC_G_ISP_BAD_PIXEL_DETECTION:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1881  		err = atomisp_bad_pixel_param(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1882  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1883  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1884  	case ATOMISP_IOC_S_ISP_BAD_PIXEL_DETECTION:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1885  		err = atomisp_bad_pixel_param(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1886  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1887  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1888  	case ATOMISP_IOC_G_ISP_FALSE_COLOR_CORRECTION:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1889  		err = atomisp_false_color_param(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1890  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1891  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1892  	case ATOMISP_IOC_S_ISP_FALSE_COLOR_CORRECTION:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1893  		err = atomisp_false_color_param(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1894  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1895  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1896  	case ATOMISP_IOC_G_ISP_CTC:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1897  		err = atomisp_ctc(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1898  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1899  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1900  	case ATOMISP_IOC_S_ISP_CTC:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1901  		err = atomisp_ctc(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1902  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1903  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1904  	case ATOMISP_IOC_G_ISP_WHITE_BALANCE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1905  		err = atomisp_white_balance_param(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1906  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1907  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1908  	case ATOMISP_IOC_S_ISP_WHITE_BALANCE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1909  		err = atomisp_white_balance_param(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1910  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1911  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1912  	case ATOMISP_IOC_G_3A_CONFIG:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1913  		err = atomisp_3a_config_param(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1914  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1915  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1916  	case ATOMISP_IOC_S_3A_CONFIG:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1917  		err = atomisp_3a_config_param(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1918  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1919  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1920  	case ATOMISP_IOC_S_ISP_FPN_TABLE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1921  		err = atomisp_fixed_pattern_table(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1922  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1923  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1924  	case ATOMISP_IOC_S_EXPOSURE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1925  		err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1926  				       core, ioctl, cmd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1927  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1928  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1929  	case ATOMISP_IOC_S_ISP_SHD_TAB:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1930  		err = atomisp_set_shading_table(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1931  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1932  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1933  	case ATOMISP_IOC_G_ISP_GAMMA_CORRECTION:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1934  		err = atomisp_gamma_correction(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1935  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1936  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1937  	case ATOMISP_IOC_S_ISP_GAMMA_CORRECTION:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1938  		err = atomisp_gamma_correction(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1939  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1940  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1941  	case ATOMISP_IOC_S_PARAMETERS:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1942  		err = atomisp_set_parameters(vdev, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1943  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1944  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1945  	case ATOMISP_IOC_EXT_ISP_CTRL:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1946  		err = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1947  				       core, ioctl, cmd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1948  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1949  	case ATOMISP_IOC_EXP_ID_UNLOCK:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1950  		err = atomisp_exp_id_unlock(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1951  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1952  	case ATOMISP_IOC_EXP_ID_CAPTURE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1953  		err = atomisp_exp_id_capture(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1954  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1955  	case ATOMISP_IOC_S_ENABLE_DZ_CAPT_PIPE:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1956  		err = atomisp_enable_dz_capt_pipe(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1957  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1958  	case ATOMISP_IOC_G_FORMATS_CONFIG:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1959  		err = atomisp_formats(asd, 0, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1960  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1961  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1962  	case ATOMISP_IOC_S_FORMATS_CONFIG:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1963  		err = atomisp_formats(asd, 1, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1964  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1965  	case ATOMISP_IOC_INJECT_A_FAKE_EVENT:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1966  		err = atomisp_inject_a_fake_event(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1967  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1968  	case ATOMISP_IOC_S_ARRAY_RESOLUTION:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1969  		err = atomisp_set_array_res(asd, arg);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1970  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1971  	default:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1972  		err = -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1973  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1974  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1975  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1976  	return err;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1977  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1978  

:::::: The code at line 1766 was first introduced by commit
:::::: 9ace178dee15432712fc70a5f84cb00695fc70b9 media: atomisp: atomisp_ioctl.c: get rid of a ISP2400/ISP2401 dependency

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
