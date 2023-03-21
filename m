Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE110E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 02:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679365689; x=1710901689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HExtAe7BVFRddIWrXvtnFcOj57HY4J20avSMDXmhL9U=;
  b=jMrzo9a4z34hlE7KM+47gnwXliG1I3I8SDqv4NsQGSCLAcgo2a2jQduZ
   ci72meNMszeyPVmpbYqKAupN8P5rD+wvYmQUzedzVc/JfsSY+LT6RG4HN
   NfFrFRL8bh8zQbxajXwY9F4msXWICzDyL+LBt+JBctKSaUV7f5TpicxCh
   1LQU//bi3QyjVHu4lichPatoAmGKD4AlKuhoepAiGcoylJXFxjBSKVN0p
   2nhlUycTkxLuIpaATt0z8jOBm1/mIXUVSFugJ08KH38Np8ShDK5VfVUM7
   8fxJlTgSYidHSpstBINm5llMmcHVsFmzRr3HvgpB6XYhqqOOnoLBMs9ex
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="425106731"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="425106731"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 19:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="750360381"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="750360381"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2023 19:28:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peRjL-000BVW-0r;
	Tue, 21 Mar 2023 02:28:07 +0000
Date: Tue, 21 Mar 2023 10:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Thornber <ejt@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:2023-03-01-thin-concurrency-8 68/68]
 drivers/md/dm-bufio-test.c:175:39: warning: cast from pointer to integer of
 different size
Message-ID: <202303211035.2nmRjoLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git 2023-03-01-thin-concurrency-8
head:   2a59884f0c38559ddd5b8474e583469a91083193
commit: 2a59884f0c38559ddd5b8474e583469a91083193 [68/68] dm-bufio-test
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303211035.2nmRjoLE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git/commit/?id=2a59884f0c38559ddd5b8474e583469a91083193
        git remote add snitzer https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git
        git fetch --no-tags snitzer 2023-03-01-thin-concurrency-8
        git checkout 2a59884f0c38559ddd5b8474e583469a91083193
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211035.2nmRjoLE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-bufio-test.c: In function 'exec_instr':
>> drivers/md/dm-bufio-test.c:175:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     175 |                 vm->registers[reg2] = (uint64_t) b;
         |                                       ^
   drivers/md/dm-bufio-test.c:196:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     196 |                 vm->registers[reg2] = (uint64_t) b;
         |                                       ^
   drivers/md/dm-bufio-test.c:218:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     218 |                         vm->registers[reg2] = (uint64_t) b;
         |                                               ^
>> drivers/md/dm-bufio-test.c:229:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     229 |                 dm_bufio_release((struct dm_buffer *) vm->registers[reg1]);
         |                                  ^
   drivers/md/dm-bufio-test.c:239:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     239 |                 dm_bufio_mark_buffer_dirty((struct dm_buffer *) vm->registers[reg1]);
         |                                            ^
   drivers/md/dm-bufio-test.c:308:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     308 |                 b = (struct dm_buffer *) vm->registers[reg1];
         |                     ^
   drivers/md/dm-bufio-test.c:326:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     326 |                 b = (struct dm_buffer *) vm->registers[reg1];
         |                     ^


vim +175 drivers/md/dm-bufio-test.c

    98	
    99	static int exec_instr(struct vm *vm, bool *halted)
   100	{
   101		int r;
   102		void *ptr;
   103		uint8_t u8, reg1, reg2;
   104		uint16_t u16;
   105		uint32_t u32, u32_2;
   106		struct dm_buffer *b;
   107		enum instruction instr;
   108	
   109		*halted = false;
   110	
   111		r = read_u8(vm, &u8);
   112		if (r)
   113			return r;
   114	
   115		instr = (enum instruction) u8;
   116		switch (instr) {
   117		case I_HALT:
   118			*halted = true;
   119			break;
   120	
   121		case I_LIT:
   122			r = read_u32(vm, &u32);
   123			if (r)
   124				return r;
   125	
   126			r = read_u8(vm, &u8);
   127			if (r)
   128				return r;
   129	
   130			vm->registers[u8] = u32;
   131			break;
   132	
   133		case I_SUB:
   134			r = read_u8(vm, &reg1);
   135			if (r)
   136				return r;
   137	
   138			r = read_u8(vm, &u8);
   139			if (r)
   140				return r;
   141	
   142			vm->registers[reg1] -= u8;
   143			break;
   144	
   145		case I_ADD:
   146			r = read_u8(vm, &reg1);
   147			if (r)
   148				return r;
   149	
   150			r = read_u8(vm, &u8);
   151			if (r)
   152				return r;
   153	
   154			vm->registers[reg1] += u8;
   155			break;
   156	
   157		case I_NEW_BUF:
   158			// block
   159			r = read_u8(vm, &reg1);
   160			if (r)
   161				return r;
   162	
   163			// dest
   164			r = read_u8(vm, &reg2);
   165			if (r)
   166				return r;
   167	
   168			ptr = dm_bufio_new(vm->bufio, vm->registers[reg1], &b);
   169			if (!ptr || IS_ERR(ptr)) {
   170				pr_alert("bufio_new(%llu) failed", (unsigned long long) vm->registers[reg1]);
   171				BUG_ON(1);
   172			}
   173	
   174			BUG_ON(!b);
 > 175			vm->registers[reg2] = (uint64_t) b;
   176			break;
   177	
   178		case I_READ_BUF:
   179			// block
   180			r = read_u8(vm, &reg1);
   181			if (r)
   182				return r;
   183	
   184			// dest
   185			r = read_u8(vm, &reg2);
   186			if (r)
   187				return r;
   188	
   189			ptr = dm_bufio_read(vm->bufio, (sector_t) vm->registers[reg1], &b);
   190			if (!ptr || IS_ERR(ptr)) {
   191				pr_alert("bufio_read(%llu) failed", (unsigned long long) vm->registers[reg1]);
   192				BUG();
   193			}
   194	
   195			BUG_ON(!b);
   196			vm->registers[reg2] = (uint64_t) b;
   197			break;
   198	
   199		case I_GET_BUF:
   200			// block
   201			r = read_u8(vm, &reg1);
   202			if (r)
   203				return r;
   204	
   205			// register
   206			r = read_u8(vm, &reg2);
   207			if (r)
   208				return r;
   209	
   210			ptr = dm_bufio_get(vm->bufio, (sector_t) vm->registers[reg1], &b);
   211			if (IS_ERR(ptr)) {
   212				pr_alert("bufio_read(%llu) failed", (unsigned long long) vm->registers[reg1]);
   213				BUG();
   214			}
   215	
   216			if (ptr) {
   217				BUG_ON(!b);
   218				vm->registers[reg2] = (uint64_t) b;
   219			}
   220			break;
   221	
   222		case I_PUT_BUF:
   223			// register
   224			r = read_u8(vm, &reg1);
   225			if (r)
   226				return r;
   227	
   228			BUG_ON(!vm->registers[reg1]);
 > 229			dm_bufio_release((struct dm_buffer *) vm->registers[reg1]);
   230			break;
   231	
   232		case I_MARK_DIRTY:
   233			// register
   234			r = read_u8(vm, &reg1);
   235			if (r)
   236				return r;
   237	
   238			BUG_ON(!vm->registers[reg1]);
   239			dm_bufio_mark_buffer_dirty((struct dm_buffer *) vm->registers[reg1]);
   240			break;
   241	
   242		case I_WRITE_ASYNC:
   243			dm_bufio_write_dirty_buffers_async(vm->bufio);
   244			break;
   245	
   246		case I_WRITE_SYNC:
   247			r = dm_bufio_write_dirty_buffers(vm->bufio);
   248			if (r) {
   249				pr_alert("write_sync failed %d", r);
   250				return r;
   251			}
   252			break;
   253	
   254		case I_FLUSH:
   255			r = dm_bufio_issue_flush(vm->bufio);
   256			if (r)
   257				return r;
   258			break;
   259	
   260		case I_FORGET:
   261			// block
   262			r = read_u32(vm, &u32);
   263			if (r)
   264				return r;
   265	
   266			dm_bufio_forget(vm->bufio, (sector_t) u32);
   267			break;
   268	
   269		case I_FORGET_RANGE:
   270			// block
   271			r = read_u32(vm, &u32);
   272			if (r)
   273				return r;
   274	
   275			// len
   276			r = read_u32(vm, &u32_2);
   277			if (r)
   278				return r;
   279			dm_bufio_forget_buffers(vm->bufio, (sector_t) u32, (sector_t) u32_2);
   280			break;
   281	
   282		case I_LOOP:
   283			// addr
   284			r = read_u16(vm, &u16);
   285			if (r)
   286				return r;
   287	
   288			// count
   289			r = read_u8(vm, &reg1);
   290			if (r)
   291				return r;
   292	
   293			if (vm->registers[reg1]) {
   294				vm->pc = vm->code_begin + u16;
   295				vm->registers[reg1]--;
   296			}
   297			break;
   298	
   299		case I_STAMP:
   300			r = read_u8(vm, &reg1);  // register containing buf
   301			if (r)
   302				return r;
   303	
   304			r = read_u8(vm, &reg2);  // contains value to stamp
   305			if (r)
   306				return r;
   307	
   308			b = (struct dm_buffer *) vm->registers[reg1];
   309			{
   310				unsigned i;
   311				uint32_t *data = dm_bufio_get_block_data(b);
   312				for (i = 0; i < 1024; i++)
   313					data[i] = (uint32_t) vm->registers[reg2];
   314			}
   315			break;
   316	
   317		case I_VERIFY:
   318			r = read_u8(vm, &reg1);  // register containing buf
   319			if (r)
   320				return r;
   321	
   322			r = read_u8(vm, &reg2);  // contains value to stamp
   323			if (r)
   324				return r;
   325	
   326			b = (struct dm_buffer *) vm->registers[reg1];
   327			{
   328				unsigned i;
   329				uint32_t *data = dm_bufio_get_block_data(b);
   330				for (i = 0; i < 1024; i++)
   331					BUG_ON(data[i] != (uint32_t) vm->registers[reg2]);
   332			}
   333			break;
   334	
   335		case I_CHECKPOINT:
   336			r = read_u8(vm, &u8);
   337			if (r)
   338				return r;
   339	
   340			pr_alert("checkpoint %u", (unsigned) u8);
   341			break;
   342	
   343		default:
   344			pr_alert("unknown instruction");
   345			return -EINVAL;
   346		}
   347	
   348		return 0;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
