Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6318ADDAD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 03:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGIWByyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701834816; x=1733370816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZoUMbaft8+2n69e5ZEEziYTTBOrHx4cG/GnSAm+2be0=;
  b=gGIWByyUHAtYQOXbxqjUk3Y7ikXNtz0Vj/J02pMdwE1g+Fx6+fYF6bwi
   GtYh88QwXsl4GJHfa8y9EWtwnYH4az4GxbvjvKwBzru/YWhBykbH0XdOh
   ZATbd+ylL05aoTeBE83uMIj7mkJwNycoiJAf+bDgN+SDyKz9NLWpbNpRA
   8S+92Q267+NWZkgT28p8ai+HSvEFustWi6tQBmgwZsCiMnh7GUJf/cxgf
   nMvl1n4k8i0xhhMRBrfUX12o2W08lHUAnUWAIfLtUsHmpEL7igHpWZNA3
   2M/a+5QxEBo1c6Vw3Qqhq5GSu2GfFUtsIT9eWVJtWebLxCJxtWo0IanFl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480198348"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="480198348"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:53:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805505957"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="805505957"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Dec 2023 19:53:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAiyZ-000ADX-1r;
	Wed, 06 Dec 2023 03:53:31 +0000
Date: Wed, 6 Dec 2023 11:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/7] media: v4l2-subdev: Turn .[gs]_frame_interval
 into pad operations
Message-ID: <202312061101.PLrz5NnJ-lkp@intel.com>
References: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bec3db03911bd85da29c1c8ee556162153002c9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-v4l2-subdev-Add-which-field-to-struct-v4l2_subdev_frame_interval/20231205-220946
base:   bec3db03911bd85da29c1c8ee556162153002c9a
patch link:    https://lore.kernel.org/r/20231205140810.22368-1-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v3 1/7] media: v4l2-subdev: Turn .[gs]_frame_interval into pad operations
config: arm-randconfig-r052-20231206 (https://download.01.org/0day-ci/archive/20231206/202312061101.PLrz5NnJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061101.PLrz5NnJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061101.PLrz5NnJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/v4l2-core/v4l2-common.c:47:
   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_g_parm_cap':
   include/media/v4l2-subdev.h:1805:25: error: implicit declaration of function 'v4l2_subdev_get_unlocked_active_state' [-Werror=implicit-function-declaration]
    1805 |                 state = v4l2_subdev_get_unlocked_active_state(sd);      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:200:15: note: in expansion of macro 'v4l2_subdev_call_state_active'
     200 |         ret = v4l2_subdev_call_state_active(sd, pad, get_frame_interval, &ival);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1805:23: warning: assignment to 'struct v4l2_subdev_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1805 |                 state = v4l2_subdev_get_unlocked_active_state(sd);      \
         |                       ^
   drivers/media/v4l2-core/v4l2-common.c:200:15: note: in expansion of macro 'v4l2_subdev_call_state_active'
     200 |         ret = v4l2_subdev_call_state_active(sd, pad, get_frame_interval, &ival);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1807:25: error: implicit declaration of function 'v4l2_subdev_lock_state'; did you mean 'v4l2_subdev_notify'? [-Werror=implicit-function-declaration]
    1807 |                         v4l2_subdev_lock_state(state);                  \
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:200:15: note: in expansion of macro 'v4l2_subdev_call_state_active'
     200 |         ret = v4l2_subdev_call_state_active(sd, pad, get_frame_interval, &ival);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1810:25: error: implicit declaration of function 'v4l2_subdev_unlock_state' [-Werror=implicit-function-declaration]
    1810 |                         v4l2_subdev_unlock_state(state);                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c:200:15: note: in expansion of macro 'v4l2_subdev_call_state_active'
     200 |         ret = v4l2_subdev_call_state_active(sd, pad, get_frame_interval, &ival);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-common.c: In function 'v4l2_s_parm_cap':
>> include/media/v4l2-subdev.h:1805:23: warning: assignment to 'struct v4l2_subdev_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1805 |                 state = v4l2_subdev_get_unlocked_active_state(sd);      \
         |                       ^
   drivers/media/v4l2-core/v4l2-common.c:227:15: note: in expansion of macro 'v4l2_subdev_call_state_active'
     227 |         ret = v4l2_subdev_call_state_active(sd, pad, set_frame_interval, &ival);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1805 include/media/v4l2-subdev.h

a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1753  
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1754  /**
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1755   * v4l2_subdev_call - call an operation of a v4l2_subdev.
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1756   *
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1757   * @sd: pointer to the &struct v4l2_subdev
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1758   * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1759   *     Each element there groups a set of callbacks functions.
aab7b7d19d038c Wolfram Sang          2019-11-10  1760   * @f: callback function to be called.
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1761   *     The callback functions are defined in groups, according to
02679876b74d26 Mauro Carvalho Chehab 2017-12-19  1762   *     each element at &struct v4l2_subdev_ops.
60d70d75c12db7 Jonathan Neuschäfer   2020-02-27  1763   * @args: arguments for @f.
21c29de1d09048 Mauro Carvalho Chehab 2016-07-20  1764   *
21c29de1d09048 Mauro Carvalho Chehab 2016-07-20  1765   * Example: err = v4l2_subdev_call(sd, video, s_std, norm);
2a1fcdf0823052 Hans Verkuil          2008-11-29  1766   */
2a1fcdf0823052 Hans Verkuil          2008-11-29  1767  #define v4l2_subdev_call(sd, o, f, args...)				\
da48c948c263c9 Arnd Bergmann         2017-07-19  1768  	({								\
3d769df5fc32dc Hans Verkuil          2019-02-08  1769  		struct v4l2_subdev *__sd = (sd);			\
da48c948c263c9 Arnd Bergmann         2017-07-19  1770  		int __result;						\
3d769df5fc32dc Hans Verkuil          2019-02-08  1771  		if (!__sd)						\
da48c948c263c9 Arnd Bergmann         2017-07-19  1772  			__result = -ENODEV;				\
3d769df5fc32dc Hans Verkuil          2019-02-08  1773  		else if (!(__sd->ops->o && __sd->ops->o->f))		\
da48c948c263c9 Arnd Bergmann         2017-07-19  1774  			__result = -ENOIOCTLCMD;			\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1775  		else if (v4l2_subdev_call_wrappers.o &&			\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1776  			 v4l2_subdev_call_wrappers.o->f)		\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1777  			__result = v4l2_subdev_call_wrappers.o->f(	\
a8fa55078a7784 Janusz Krzysztofik    2019-05-20  1778  							__sd, ##args);	\
da48c948c263c9 Arnd Bergmann         2017-07-19  1779  		else							\
3d769df5fc32dc Hans Verkuil          2019-02-08  1780  			__result = __sd->ops->o->f(__sd, ##args);	\
da48c948c263c9 Arnd Bergmann         2017-07-19  1781  		__result;						\
da48c948c263c9 Arnd Bergmann         2017-07-19  1782  	})
2a1fcdf0823052 Hans Verkuil          2008-11-29  1783  
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1784  /**
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1785   * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1786   *				   takes state as a parameter, passing the
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1787   *				   subdev its active state.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1788   *
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1789   * @sd: pointer to the &struct v4l2_subdev
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1790   * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1791   *     Each element there groups a set of callbacks functions.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1792   * @f: callback function to be called.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1793   *     The callback functions are defined in groups, according to
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1794   *     each element at &struct v4l2_subdev_ops.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1795   * @args: arguments for @f.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1796   *
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1797   * This is similar to v4l2_subdev_call(), except that this version can only be
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1798   * used for ops that take a subdev state as a parameter. The macro will get the
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1799   * active state, lock it before calling the op and unlock it after the call.
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1800   */
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1801  #define v4l2_subdev_call_state_active(sd, o, f, args...)		\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1802  	({								\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1803  		int __result;						\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1804  		struct v4l2_subdev_state *state;			\
ed647ea668fb27 Tomi Valkeinen        2022-04-12 @1805  		state = v4l2_subdev_get_unlocked_active_state(sd);	\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1806  		if (state)						\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1807  			v4l2_subdev_lock_state(state);			\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1808  		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1809  		if (state)						\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1810  			v4l2_subdev_unlock_state(state);		\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1811  		__result;						\
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1812  	})
ed647ea668fb27 Tomi Valkeinen        2022-04-12  1813  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
