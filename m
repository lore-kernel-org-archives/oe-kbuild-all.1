Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948592;
	b=ns6QqMB0g4lBP3TAWSER2Hpc1V4rETnPonAQc2G8PfH+oMe7O5/jSTud5KRl2yKTf6xa
	 AJ5JaIGp9xqzmdXHkq/ppcb+HyniyS6h03h5nmxqsncRGsifWWPwHmrJv6sJHoS+Hl9MM
	 96mu8WsjOunaakUOrHw7zTTYo1szGkkYobak0ff3uuCKDjgZh4syQJH+jfb6lYIx2Ikcs
	 4+a2sA/dvnXYdb0HJ7QV77ge/X1dcSiTIWovUPx8oXJMnKkKGMRl5P7pWJwYW78KdQRDt
	 CJiLHTbT1m+IBPcxgscl7BVSquEdtR4iJZsQ/v/hhCyJyNCfi+CMacnQOvG8jRYlF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948592;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=v0hSV39Jb2qDfvSJoz9AFxEdgVxMR1cH8CYWLrSHRYQ=;
	b=uLv+qFcpLco06LziTz1jZr3sZG85ERS2+gcxsi8S4EgAtk8X8UtjEgD+OPe25Sw4Fv4H
	 yXQHljH/HFLwLmnX04L97dZfO7NptTEf/ScLRCcH0GR+kZO3F1xq5l0E/qCmsGmNjMvOO
	 az0m5QgaSrBNZ+JwRuJIRCrRYxyG6b7hqvF4XkM2NHLQ5gFgOU/LrJ7PnNLdgAo6QP/Tn
	 VRc9aSYZ34MUH0Npbd/TsS4MGx01Dhqx56dWxXcx43TfIbYBQufjRWD4QcuPfs2NoaStt
	 M3b1hIVLphLB67k8G/ihN6GjVYynj5INy77R74vvkMB3xnbqQoCcIhda2onlvr7paUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AO59UyuW;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F636606A331
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 20:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F636606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AO59UyuW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794948591; x=1826484591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=of3OpuqCe+xv7JIj1bArW1EVcNbtu9RMdNaP+TR4vlc=;
  b=AO59UyuWqa5DK8VeOv8E87tlYMq18l4BUp3viKU8e2UpkP3EaZH3tJ+w
   48lLPqMw3x+mSB24Fx/z3cws+AjNG2+ddXGc7NePLmLsNx0FL5xxcFdb1
   i3V2b7oSU4867yBXIbnneLKrv871jFUZWqehGJcJyzczQCdwZc/uSqjO2
   rQGQb1SWLi05ojzx1X6qk/QNtJZY7mJZYhi1qKN9Ck4ZC0zefT6/E5ZiN
   8qWf8xwH6HNoMQdGmf75b5bb1rYx1ApNISszLMdjOxo0gdgKp+jiG/Zhi
   QXC6VB5Q/2dvs79Wo75Cnmx5dTyVVT3qNXB49ACbGsYIj7X0ve3zGsB1t
   Q==;
X-CSE-ConnectionGUID: ciOIHFKdSwum+PzdikUXMg==
X-CSE-MsgGUID: Cjd0FEUvR9u1aKZI+GDXkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3778701"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3778701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 12:49:51 -0800
X-CSE-ConnectionGUID: R4eVa/JyRLWc8eS7YdD0ZQ==
X-CSE-MsgGUID: KGQHJuGkQBa+z4Sw0p3Mgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9716437"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2026 12:49:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTQ7d-00000001CRR-27DM;
	Tue, 17 Nov 2026 20:49:45 +0000
Date: Wed, 18 Nov 2026 04:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 14/19] drm/amd/display: Restrict the dc directory root to
 DC-internal builds
Message-ID: <202611180455.JKWVPyFi-lkp@intel.com>
References: <20261112-amdgpu-dc-cleanup-v1-14-0fae41718ad2@redhat.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-amdgpu-dc-cleanup-v1-14-0fae41718ad2@redhat.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on a6836fcbb5b22968019256025321d655b78bc49c]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie-via-B4-Relay/drm-amd-display-Drop-the-dead-vmid-module/20261112-114336
base:   a6836fcbb5b22968019256025321d655b78bc49c
patch link:    https://lore.kernel.org/r/20261112-amdgpu-dc-cleanup-v1-14-0fae41718ad2%40redhat.com
patch subject: [PATCH 14/19] drm/amd/display: Restrict the dc directory root to DC-internal builds
config: i386-randconfig-1006-20260925 (https://download.01.org/0day-ci/archive/20261118/202611180455.JKWVPyFi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/202611180455.JKWVPyFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611180455.JKWVPyFi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:57,
                    from drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c:24:
>> drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26:10: fatal error: dm_services_types.h: No such file or directory
      26 | #include "dm_services_types.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +26 drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h

a2dd023a7788ba6 Eric Huang 2017-03-06  25  
20582319bce482e Rex Zhu    2018-06-20 @26  #include "dm_services_types.h"
20582319bce482e Rex Zhu    2018-06-20  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
