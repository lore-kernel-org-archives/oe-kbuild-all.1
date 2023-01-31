Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42433E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675166696; x=1706702696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m6yimzeU8lC+kMOeLFbJ6X5ctGHuJ9CIrX08X9/wh+o=;
  b=MB3+z/h7BHrPsWBOpWILxa/bdMYosONJOBKCY6Kz5jO+PN7GnnLbu7cK
   x5CAFi/Fd9uR9tWIZx7TaHpVIHYvcRTfsS04mjA1Jl+Ti8B0o8kVsXFMu
   JhumuQxuIxdXJClSJQPVE1gYW8EMtruFoync5uZ6jnppIUhjZH/nmmEqX
   rKV4PPgviwutTtK1jsbfmTLOVN7mE30zqIQZq6QlPQ4gIBDLYyOfl/9+w
   Cy2byCVqqEFv3orI5f+puYzDxAeaJvI+GcFiZSF1rxDL7ANTYCBf37xik
   5jM2ZO1Y1G3rvtqffPQtm7oUIkm6TOzeaOjTR5jz6sEK+NxuBdTgSuQVy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308166427"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="308166427"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 04:04:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="909883361"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="909883361"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 04:04:52 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMpNb-0004Pi-24;
	Tue, 31 Jan 2023 12:04:51 +0000
Date: Tue, 31 Jan 2023 20:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 12/12] acl: remove posix acl handlers
Message-ID: <202301311947.dXUqGsyN-lkp@intel.com>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-12-6cf155b492b6@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v1-12-6cf155b492b6@kernel.org>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on 1b929c02afd37871d5afb9d498426f83432e71c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/xattr-simplify-listxattr-helpers/20230125-193230
base:   1b929c02afd37871d5afb9d498426f83432e71c2
patch link:    https://lore.kernel.org/r/20230125-fs-acl-remove-generic-xattr-handlers-v1-12-6cf155b492b6%40kernel.org
patch subject: [PATCH 12/12] acl: remove posix acl handlers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230131/202301311947.dXUqGsyN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e85a197723c6dd4770a12ded9ea9cae44c75a2c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Brauner/xattr-simplify-listxattr-helpers/20230125-193230
        git checkout e85a197723c6dd4770a12ded9ea9cae44c75a2c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/fuse/xattr.c:239:10: error: 'posix_acl_access_xattr_handler' undeclared here (not in a function); did you mean 'posix_acl_xattr_header'?
     239 |         &posix_acl_access_xattr_handler,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          posix_acl_xattr_header
>> fs/fuse/xattr.c:240:10: error: 'posix_acl_default_xattr_handler' undeclared here (not in a function); did you mean 'posix_acl_xattr_header'?
     240 |         &posix_acl_default_xattr_handler,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          posix_acl_xattr_header


vim +239 fs/fuse/xattr.c

60bcc88ad185d51 Seth Forshee      2016-08-29  237  
60bcc88ad185d51 Seth Forshee      2016-08-29  238  const struct xattr_handler *fuse_acl_xattr_handlers[] = {
60bcc88ad185d51 Seth Forshee      2016-08-29 @239  	&posix_acl_access_xattr_handler,
60bcc88ad185d51 Seth Forshee      2016-08-29 @240  	&posix_acl_default_xattr_handler,
60bcc88ad185d51 Seth Forshee      2016-08-29  241  	&fuse_xattr_handler,
60bcc88ad185d51 Seth Forshee      2016-08-29  242  	NULL
60bcc88ad185d51 Seth Forshee      2016-08-29  243  };
e45b2546e23c2d1 Eric W. Biederman 2018-05-04  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
