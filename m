Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549787E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683013880; x=1714549880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2eh6u4eYk1nA9IF/J4B0vDu5YsSUi5xGOjYXklPwxcs=;
  b=cIOtZBZUibi5PilbITUYIcO27v10791DtPAO4LIHzyIdQBsSABL+6t0G
   U067Aam2EXi9n9LtNqPCyo6/Ezu+lnnUAGg4AjY5hheIrm8sGDI+PGk4y
   XRoRw95zXNq3+9HPC4nPCKZFUSnafSq4Dp6gche9uKCPZu2fW7IZWbvIB
   wDZVjtIiXQOKLY3iWFekr/V8dr0xEKjT8M04ZawANSbzN7+su62yvqoQd
   Wmu6Obg6QZPTMDxRfQSIYaIrJm7nfSujP+jmVHrkZLjjW6WeB9STLmLeJ
   9pRIVMYuQtellqPnNzzy39ZCrM9J+Ar75AXF8HrudwpJOVACgheQ+wPR3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328706435"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="328706435"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 00:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="696082224"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="696082224"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 May 2023 00:51:18 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptkn7-0000vA-1u;
	Tue, 02 May 2023 07:51:17 +0000
Date: Tue, 2 May 2023 15:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 3/8] dpll: documentation on DPLL subsystem
 interface
Message-ID: <202305021532.Z2jjjmzh-lkp@intel.com>
References: <20230428002009.2948020-4-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-4-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.3]
[cannot apply to tnguy-next-queue/dev-queue linus/master next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230428002009.2948020-4-vadfed%40meta.com
patch subject: [RFC PATCH v7 3/8] dpll: documentation on DPLL subsystem interface
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/fe02747a2a3103b5309f4a669980927ed01cc1dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
        git checkout fe02747a2a3103b5309f4a669980927ed01cc1dd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021532.Z2jjjmzh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/dpll.rst:60: WARNING: Unexpected indentation.
>> Documentation/dpll.rst:66: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/dpll.rst:68: WARNING: Bullet list ends without a blank line; unexpected unindent.
>> Documentation/dpll.rst:108: WARNING: Inline literal start-string without end-string.
>> Documentation/dpll.rst:101: WARNING: Definition list ends without a blank line; unexpected unindent.
>> Documentation/dpll.rst:153: WARNING: Malformed table.
>> Documentation/networking/index.rst:8: WARNING: toctree contains reference to nonexisting document 'networking/dpll'
>> Documentation/dpll.rst: WARNING: document isn't included in any toctree

vim +60 Documentation/dpll.rst

    55	
    56	In manual mode (``DPLL_MODE_MANUAL``) the user can request or receive
    57	one of following pin states:
    58	- ``DPLL_PIN_STATE_CONNECTED`` - the pin is used to drive dpll device
    59	- ``DPLL_PIN_STATE_DISCONNECTED`` - the pin is not used to drive dpll
  > 60	  device
    61	
    62	In automatic mode (``DPLL_MODE_AUTOMATIC``) the user can request or
    63	receive one of following pin states:
    64	- ``DPLL_PIN_STATE_SELECTABLE`` - the pin shall be considered as valid
    65	  source for automatic selection algorithm
  > 66	- ``DPLL_PIN_STATE_DISCONNECTED`` - the pin shall be not considered as
    67	  a valid source for automatic selection algorithm
  > 68	In automatic mode (``DPLL_MODE_AUTOMATIC``) the user can only receive
    69	pin state ``DPLL_PIN_STATE_CONNECTED`` once automatic selection
    70	algorithm locks a dpll device with one of the sources.
    71	
    72	
    73	Shared pins
    74	===========
    75	A single pin object can be registered to multiple dpll devices.
    76	Then there are two groups of configuration knobs:
    77	1) Set on a pin - the configuration affects all dpll devices pin is
    78	   registered to. (i.e. ``PIN_FREQUENCY``, ``PIN_DIRECTION``),
    79	2) Set on a pin-dpll tuple - the configuration affects only selected
    80	   dpll device. (i.e. PIN_PRIO, PIN_STATE).
    81	
    82	
    83	MUX-type pins
    84	=============
    85	A pin can be MUX-type, it aggregates child pins and serves as a pin
    86	multiplexer. One or more pins are registered with MUX-type instead of
    87	being directly registered to a dpll device.
    88	Pins registered with a MUX-type provide user with additional nested
    89	attribute ``DPLL_A_PIN_PARENT`` for each parent they were registered
    90	with.
    91	If a pin was registered with multiple parent pins, they behave like a
    92	multiple output multiplexer. In this case output of a
    93	``DPLL_CMD_PIN_GET`` would contain multiple pin-parent nested
    94	attributes with current state related to each parent, like:
    95	
    96	``'pin': [{
    97	        'device': [{'bus-name': 'pci',
    98	                    'dev-name': '0000:21:00.0_0', 'id': 0}],
    99	        'pin-direction': {'doc': 'pin used as a source of a signal',
   100	                          'name': 'source'},
 > 101	        'pin-idx': 13,
   102	        'pin-parent': [{'pin-parent-idx': 2,
   103	                        'pin-state': {'doc': 'pin disconnected',
   104	                                      'name': 'disconnected'}},
   105	                       {'pin-parent-idx': 3,
   106	                        'pin-state': {'doc': 'pin disconnected',
   107	                                      'name': 'disconnected'}}],
 > 108	        }]``
   109	
   110	Only one child pin can provide it's signal to the parent MUX-type pin at
   111	a time, the selection is done with requesting change of child pin state
   112	to ``DPLL_PIN_STATE_CONNECTED`` and providing a target MUX-type pin
   113	index value in ``DPLL_A_PARENT_PIN_IDX``.
   114	
   115	Pin priority
   116	============
   117	Some devices might offer a capability of automatic pin selection mode
   118	(enum value ``DPLL_MODE_AUTOMATIC`` of ``DPLL_A_MODE`` attribute).
   119	Usually such automatic selection is offloaded to the hardware,
   120	which means only pins directly connected to the dpll are capable of
   121	automatic source pin selection.
   122	In automatic selection mode, the user cannot manually select a source
   123	pin for the device, instead the user shall provide all directly
   124	connected pins with a priority ``DPLL_A_PIN_PRIO``, the device would
   125	pick a highest priority valid signal and connect with it.
   126	Child pin of MUX-type is not capable of automatic source pin selection,
   127	in order to configure a source of a MUX-type pin, the user needs to
   128	request desired pin state of the child pin on the parent - it is done
   129	with providing additional attribute for pin set state request - index
   130	of parent pin he wish to propagate its signal to
   131	(``DPLL_A_PARENT_PIN_IDX``).
   132	
   133	
   134	Configuration commands group
   135	============================
   136	
   137	Configuration commands are used to get or dump information about
   138	registered dpll devices (and pins), as well as set configuration of
   139	device or pins. As dpll device could not be abstract and reflects real
   140	hardware, there is no way to add new dpll device via netlink from user
   141	space and each device should be registered by it's driver.
   142	
   143	All netlink commands require ``GENL_ADMIN_PERM``. This is to prevent
   144	any spamming/D.o.S. from unauthorized userspace applications.
   145	
   146	List of netlink commands with possible attributes
   147	=================================================
   148	
   149	All constants identifying command types use ``DPLL_CMD_`` prefix and
   150	suffix according to command purpose. All attributes use ``DPLL_A_``
   151	prefix and suffix according to attribute purpose:
   152	
 > 153	  ============================  =======================================
   154	  ``DEVICE_GET``                command to get device info or dump list
   155	                                of available devices
   156	    ``ID``                      attr internal dpll device ID
   157	    ``DEV_NAME``                attr dpll device name
   158	    ``BUS_NAME``                attr dpll device bus name
   159	    ``MODE``                    attr selection mode
   160	    ``MODE_SUPPORTED``          attr available selection modes
   161	    ``LOCK_STATUS``             attr internal frequency-lock status
   162	    ``TEMP``                    attr device temperature information
   163	    ``CLOCK_ID``                attr Unique Clock Identifier (EUI-64),
   164	                                as defined by the IEEE 1588 standard
   165	    ``TYPE``                    attr type or purpose of dpll device
   166	  ``DEVICE_SET``                command to set dpll device configuration
   167	    ``ID``                      attr internal dpll device index
   168	    ``NAME``                    attr dpll device name (not required if
   169	                                dpll device index was provided)
   170	    ``MODE``                    attr selection mode to configure
   171	  ``PIN_GET``                   command to get pin info or dump list of
   172	                                available pins
   173	    ``DEVICE``                  nest attr for each dpll device pin is
   174	                                connected with
   175	      ``ID``                    attr internal dpll device ID
   176	      ``DEV_NAME``              attr dpll device name
   177	      ``BUS_NAME``              attr dpll device bus name
   178	      ``PIN_PRIO``              attr priority of pin on the dpll device
   179	      ``PIN_STATE``             attr state of pin on the dpll device
   180	    ``PIN_IDX``                 attr index of a pin on the dpll device
   181	    ``PIN_DESCRIPTION``         attr description provided by driver
   182	    ``PIN_TYPE``                attr type of a pin
   183	    ``PIN_DIRECTION``           attr direction of a pin
   184	    ``PIN_FREQUENCY``           attr current frequency of a pin
   185	    ``PIN_FREQUENCY_SUPPORTED`` attr provides supported frequencies
   186	    ``PIN_ANY_FREQUENCY_MIN``   attr minimum value of frequency in case
   187	                                pin/dpll supports any frequency
   188	    ``PIN_ANY_FREQUENCY_MAX``   attr maximum value of frequency in case
   189	                                pin/dpll supports any frequency
   190	    ``PIN_PARENT``              nest attr for each MUX-type parent, that
   191	                                pin is connected with
   192	      ``PIN_PARENT_IDX``        attr index of a parent pin on the dpll
   193	                                device
   194	      ``PIN_STATE``             attr state of a pin on parent pin
   195	    ``PIN_RCLK_DEVICE``         attr name of a device, where pin
   196	                                recovers clock signal from
   197	    ``PIN_DPLL_CAPS``           attr bitmask of pin-dpll capabilities
   198	
   199	  ``PIN_SET``                   command to set pins configuration
   200	    ``ID``                      attr internal dpll device index
   201	    ``BUS_NAME``                attr dpll device name (not required if
   202	                                dpll device ID was provided)
   203	    ``DEV_NAME``                attr dpll device name (not required if
   204	                                dpll device ID was provided)
   205	    ``PIN_IDX``                 attr index of a pin on the dpll device
   206	    ``PIN_DIRECTION``           attr direction to be set
   207	    ``PIN_FREQUENCY``           attr frequency to be set
   208	    ``PIN_PRIO``                attr pin priority to be set
   209	    ``PIN_STATE``               attr pin state to be set
   210	    ``PIN_PARENT_IDX``          attr if provided state is to be set with
   211	                                parent pin instead of with dpll device
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
