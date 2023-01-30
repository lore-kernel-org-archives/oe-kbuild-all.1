Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A028E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675089967; x=1706625967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YgowaJgvhfMdwK5CTwfzXDYqbeauxrvDImqmBhcLmCA=;
  b=QZYidm3G/h5u1uXh08Ph20aRHes01t9naX4fHCtu4t9iVEWy5PWvHBgB
   Ver8iF/9ZpEp1JFvvwvucvArBA+CyJMnylrl8ZSnP6gU43pMSmRZFGlFv
   Ou7C2EJpGJevVOL8I+gK/Puti4VJ988TY93n+DVJ2Y/mYAU1GDn+6R3r3
   qIefnWPJUmC6QW91prRr4qCTtoS574R2w0IfPkmK924P0TAl/ItWh9UsF
   KG+T02ITjHbP2ftZeIqatQezKPdGC8T0bWQhTcX201IhFbb0y54kMh36z
   hUDLHxkJYFQzlF9XG+LNYzhNUcrnYn6Oqm89iCYb032HJlCVg/H5RXdid
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311192089"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="311192089"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 06:46:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="727526120"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="727526120"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2023 06:46:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMVQ5-0003go-0m;
	Mon, 30 Jan 2023 14:46:05 +0000
Date: Mon, 30 Jan 2023 22:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] staging: vc04_services: Drop remnants of custom
 logging
Message-ID: <202301302201.y7J5pYI0-lkp@intel.com>
References: <20230118115810.21979-5-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118115810.21979-5-umang.jain@ideasonboard.com>

Hi Umang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next next-20230130]
[cannot apply to staging/staging-linus linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/staging-vc04_services-vchiq_core-Drop-custom-logging/20230118-203726
patch link:    https://lore.kernel.org/r/20230118115810.21979-5-umang.jain%40ideasonboard.com
patch subject: [RFC PATCH 4/4] staging: vc04_services: Drop remnants of custom logging
config: loongarch-randconfig-r035-20230129 (https://download.01.org/0day-ci/archive/20230130/202301302201.y7J5pYI0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/953bb4f9c58d3809d113fdc739f6e38e51f4096f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Umang-Jain/staging-vc04_services-vchiq_core-Drop-custom-logging/20230118-203726
        git checkout 953bb4f9c58d3809d113fdc739f6e38e51f4096f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.o: in function `.LFB3579':
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:2033: undefined reference to `vchiq_sync_log_level'
>> loongarch64-linux-ld: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:2033: undefined reference to `vchiq_sync_log_level'
>> loongarch64-linux-ld: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:2033: undefined reference to `vchiq_sync_log_level'


vim +2033 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c

  1994	
  1995	/* Called by the sync thread */
  1996	static int
  1997	sync_func(void *v)
  1998	{
  1999		struct vchiq_state *state = v;
  2000		struct vchiq_shared_state *local = state->local;
  2001		struct vchiq_header *header =
  2002			(struct vchiq_header *)SLOT_DATA_FROM_INDEX(state,
  2003				state->remote->slot_sync);
  2004	
  2005		while (1) {
  2006			struct vchiq_service *service;
  2007			int msgid, size;
  2008			int type;
  2009			unsigned int localport, remoteport;
  2010	
  2011			remote_event_wait(&state->sync_trigger_event, &local->sync_trigger);
  2012	
  2013			/* Ensure that reads don't overtake the remote_event_wait. */
  2014			rmb();
  2015	
  2016			msgid = header->msgid;
  2017			size = header->size;
  2018			type = VCHIQ_MSG_TYPE(msgid);
  2019			localport = VCHIQ_MSG_DSTPORT(msgid);
  2020			remoteport = VCHIQ_MSG_SRCPORT(msgid);
  2021	
  2022			service = find_service_by_port(state, localport);
  2023	
  2024			if (!service) {
  2025				dev_err(state->dev,
  2026					"%d: sf %s@%pK (%d->%d) - invalid/closed service %d",
  2027					state->id, msg_type_str(type), header,
  2028					remoteport, localport, localport);
  2029				release_message_sync(state, header);
  2030				continue;
  2031			}
  2032	
> 2033			if (vchiq_sync_log_level >= LOGLEVEL_DEBUG) {
  2034				int svc_fourcc;
  2035	
  2036				svc_fourcc = service
  2037					? service->base.fourcc
  2038					: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
  2039				dev_dbg(state->dev,
  2040					"Rcvd Msg %s from %c%c%c%c s:%d d:%d len:%d",
  2041					msg_type_str(type), VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
  2042					remoteport, localport, size);
  2043				if (size > 0)
  2044					vchiq_log_dump_mem("Rcvd", 0, header->data, min(16, size));
  2045			}
  2046	
  2047			switch (type) {
  2048			case VCHIQ_MSG_OPENACK:
  2049				if (size >= sizeof(struct vchiq_openack_payload)) {
  2050					const struct vchiq_openack_payload *payload =
  2051						(struct vchiq_openack_payload *)
  2052						header->data;
  2053					service->peer_version = payload->version;
  2054				}
  2055				dev_info(state->dev, "%d: sf OPENACK@%pK,%x (%d->%d) v:%d",
  2056					 state->id, header, size, remoteport, localport,
  2057					 service->peer_version);
  2058				if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
  2059					service->remoteport = remoteport;
  2060					set_service_state(service, VCHIQ_SRVSTATE_OPENSYNC);
  2061					service->sync = 1;
  2062					complete(&service->remove_event);
  2063				}
  2064				release_message_sync(state, header);
  2065				break;
  2066	
  2067			case VCHIQ_MSG_DATA:
  2068				dev_dbg(state->dev, "%d: sf DATA@%pK,%x (%d->%d)",
  2069					state->id, header, size, remoteport, localport);
  2070	
  2071				if ((service->remoteport == remoteport) &&
  2072				    (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)) {
  2073					if (make_service_callback(service, VCHIQ_MESSAGE_AVAILABLE, header,
  2074								  NULL) == -EAGAIN)
  2075						dev_err(state->dev,
  2076							"synchronous callback to service %d returns -EAGAIN",
  2077							localport);
  2078				}
  2079				break;
  2080	
  2081			default:
  2082				dev_err(state->dev, "%d: sf unexpected msgid %x@%pK,%x",
  2083					state->id, msgid, header, size);
  2084				release_message_sync(state, header);
  2085				break;
  2086			}
  2087	
  2088			vchiq_service_put(service);
  2089		}
  2090	
  2091		return 0;
  2092	}
  2093	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
