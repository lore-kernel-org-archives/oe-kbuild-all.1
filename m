Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3232FFDEA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762025265; cv=none; b=LzQv0E3BQJ7WMFrF5NNhrezzHnzIZNRXwEeZXXimyFCkXckgRoctDDsRWN+0nLsgfCRuNTeRkfaytAf8AVT9D81o2AvLIIsmB6zF2Oon0xjNp5qAoPOoSavNjd1FsLRKy9kKpNQsaczbJIEn1XksF5eS4FXU4u3ioToqwkXBtE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762025265; c=relaxed/simple;
	bh=T6eToX4zT4Vnsc3dC/npPWb8L98yinsczq7cJPXzrOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TR/AGi8Vtx1o8wOqNzzKHGpIDmat5X5H1b9bWfL3e1rR4KYk2tamiwJzaZX212cpormMFT8xTwP5L/0Hd8047zRtgjsEbnwb1T6tTGI5Q9dAKF8ZzHIbV2Y+tw2WAOu2w0XM0vasqCsWSiUX9ETpMPi96xxZKI/C/6EKyyN+HEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBkyAnrh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBkyAnrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762025263; x=1793561263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6eToX4zT4Vnsc3dC/npPWb8L98yinsczq7cJPXzrOM=;
  b=eBkyAnrhAVWHFerTKbULwDYMskI/cDSaVTQKxxjNMR0H9GP12hr3ktmw
   IV+tlV6jFa1Tn6x6eUq1LyUNVA/nnTFpsVrBA4AA23twCVjUkhGl+ln/P
   XrlfBqnAwKOtt67Gq3p5/kFw33uLdyrbvpfFaHBVd0oi5MZJBfnA+bOAs
   q3Fm01hDCe7MlTbOzy420rc3YeE3l5PXNiOtNuCcPtk15DgoXw5ugqQq3
   IgPS5sFRzub9Zjj8RynOOtBOjsgtjhDth8k1rdFLDGyFRjCglksWBJlQj
   jh9/x9OCH1xWuUGlaR1SCUcsa+QQOI1jsRUlLm5BV/W08ebeopDJmDMzG
   g==;
X-CSE-ConnectionGUID: wqDzKUnVQ/S3uBJaXwEwcA==
X-CSE-MsgGUID: vzDPQezjTBShoRG85O/ILg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="81788202"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="81788202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 12:27:42 -0700
X-CSE-ConnectionGUID: vQf8RfPES829IHJ+gVjE5g==
X-CSE-MsgGUID: x7NcyqFZQ0agIiIOZx8+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186463236"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 12:27:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFHFb-000Od8-0Q;
	Sat, 01 Nov 2025 19:27:07 +0000
Date: Sun, 2 Nov 2025 03:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/ubus_config.c:191:6:
 warning: no previous prototype for function 'ub_sync_cfg_rsp_handle'
Message-ID: <202511020347.upGDrs6j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6a5b2f9a14178b13fe5efc52ba6575f5294c1270
commit: 280895301d3bc3507606cbd2e3cdccba75a8dcdc [3075/3075] ub:ubus: Support Ubus read/write configuration functions
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251102/202511020347.upGDrs6j-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020347.upGDrs6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020347.upGDrs6j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/ubus_config.c:191:6: warning: no previous prototype for function 'ub_sync_cfg_rsp_handle' [-Wmissing-prototypes]
     191 | void ub_sync_cfg_rsp_handle(struct cfg_msg_pld_rsp *rsp, u8 size,
         |      ^
   drivers/ub/ubus/ubus_config.c:191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     191 | void ub_sync_cfg_rsp_handle(struct cfg_msg_pld_rsp *rsp, u8 size,
         | ^
         | static 
>> drivers/ub/ubus/ubus_config.c:310:5: warning: no previous prototype for function '__ub_cfg_read_byte' [-Wmissing-prototypes]
     310 | int __ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
         |     ^
   drivers/ub/ubus/ubus_config.c:310:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     310 | int __ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
         | ^
         | static 
>> drivers/ub/ubus/ubus_config.c:320:5: warning: no previous prototype for function '__ub_cfg_read_word' [-Wmissing-prototypes]
     320 | int __ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
         |     ^
   drivers/ub/ubus/ubus_config.c:320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     320 | int __ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
         | ^
         | static 
>> drivers/ub/ubus/ubus_config.c:330:5: warning: no previous prototype for function '__ub_cfg_read_dword' [-Wmissing-prototypes]
     330 | int __ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
         |     ^
   drivers/ub/ubus/ubus_config.c:330:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     330 | int __ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
         | ^
         | static 
>> drivers/ub/ubus/ubus_config.c:340:5: warning: no previous prototype for function '__ub_cfg_write_byte' [-Wmissing-prototypes]
     340 | int __ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
         |     ^
   drivers/ub/ubus/ubus_config.c:340:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     340 | int __ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
         | ^
         | static 
>> drivers/ub/ubus/ubus_config.c:350:5: warning: no previous prototype for function '__ub_cfg_write_word' [-Wmissing-prototypes]
     350 | int __ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
         |     ^
   drivers/ub/ubus/ubus_config.c:350:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     350 | int __ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
         | ^
         | static 
>> drivers/ub/ubus/ubus_config.c:360:5: warning: no previous prototype for function '__ub_cfg_write_dword' [-Wmissing-prototypes]
     360 | int __ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)
         |     ^
   drivers/ub/ubus/ubus_config.c:360:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     360 | int __ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)
         | ^
         | static 
   7 warnings generated.


vim +/ub_sync_cfg_rsp_handle +191 drivers/ub/ubus/ubus_config.c

   190	
 > 191	void ub_sync_cfg_rsp_handle(struct cfg_msg_pld_rsp *rsp, u8 size,
   192				    u64 pos, bool write, u32 *val)
   193	{
   194	#define UB_CFG_REG_SIZE 4
   195		u8 pos_in_reg = pos % UB_CFG_REG_SIZE;
   196		u32 read_data;
   197	
   198		if (!write) {
   199			read_data = rsp->read_data >> (pos_in_reg * BITS_PER_BYTE);
   200			if (size == sizeof(u8))
   201				*(u8 *)val = read_data;
   202			else if (size == sizeof(u16))
   203				*(u16 *)val = read_data;
   204			else
   205				*val = read_data;
   206		}
   207	}
   208	
   209	static u8 gen_cfg_sub_msg_code(bool is_write, u64 pos)
   210	{
   211		if (pos >= UB_CFG1_BASIC_SLICE && pos < UB_PORT_SLICE_START)
   212			return is_write ? UB_CFG1_WRITE : UB_CFG1_READ;
   213		else
   214			return is_write ? UB_CFG0_WRITE : UB_CFG0_READ;
   215	}
   216	
   217	static void ub_msg_pkt_req_init(struct ub_entity *uent, u8 size, u64 pos, u32 *val,
   218					struct cfg_msg_pld_req *req)
   219	{
   220		u8 bt_mask = ub_cfg_param[size >> 1].byte_mask;
   221	
   222		if (val) {
   223			if (size == sizeof(u8))
   224				req->write_data = *(u8 *)val;
   225			else if (size == sizeof(u16))
   226				req->write_data = *(u16 *)val;
   227			else
   228				req->write_data = *val;
   229			req->write_data <<= ((pos % sizeof(u32)) * BITS_PER_BYTE);
   230		}
   231	
   232		req->byte_enable = bt_mask << (u8)(pos % sizeof(u32));
   233		req->entity_idx = uent->entity_idx;
   234		/* The address is in four bytes. */
   235		req->req_addr = pos / sizeof(u32);
   236	}
   237	
   238	static int ub_sync_cfg(struct ub_entity *uent, u8 size, u64 pos, bool iswrite,
   239			       u32 *val)
   240	{
   241		struct cfg_msg_req_pkt req_pkt = {};
   242		struct cfg_msg_rsp_pkt rsp_pkt = {};
   243		struct msg_info info = {};
   244		u8 sub_msg_code;
   245		int ret;
   246	
   247		if (!pos_size_valid(pos, size)) {
   248			ub_err(uent, "pos or size invalid, pos=%#llx, size=%#x\n", pos,
   249			       size);
   250			return -EINVAL;
   251		}
   252	
   253		if (!iswrite)
   254			memset(val, 0xFF, size);
   255	
   256		sub_msg_code = gen_cfg_sub_msg_code(iswrite, pos);
   257		ub_msg_pkt_header_init(&req_pkt.header, uent, CFG_MSG_PLD_SIZE,
   258				       code_gen(UB_MSG_CODE_CFG, sub_msg_code,
   259						MSG_REQ), false);
   260	
   261		ub_msg_pkt_req_init(uent, size, pos, (iswrite ? val : NULL),
   262				    &req_pkt.req_payload);
   263	
   264		message_info_init(&info, uent, &req_pkt, &rsp_pkt,
   265				  (MSG_CFG_PKT_SIZE << MSG_REQ_SIZE_OFFSET) |
   266					  MSG_CFG_PKT_SIZE);
   267		ret = message_sync_request(uent->message->mdev, &info,
   268					   req_pkt.header.msgetah.code);
   269		if (ret)
   270			return ret;
   271	
   272		ret = ub_sync_cfg_rsp_check(uent, &req_pkt, &rsp_pkt);
   273		if (!ret)
   274			ub_sync_cfg_rsp_handle(&rsp_pkt.rsp_payload, size, pos, iswrite, val);
   275	
   276		return ret;
   277	}
   278	
   279	int ub_send_cfg(struct ub_entity *uent, u8 size, u64 pos, u32 *val)
   280	{
   281		struct cfg_msg_req_pkt req_pkt = {};
   282		struct msg_info info = {};
   283		u8 sub_msg_code;
   284	
   285		if (!uent || !uent->message || !uent->message->mdev) {
   286			pr_err("uent or message or mdev is null\n");
   287			return -EINVAL;
   288		}
   289	
   290		if (!pos_size_valid(pos, size)) {
   291			pr_err("pos or size invalid, pos=%#llx, size=%u\n", pos, size);
   292			return -EINVAL;
   293		}
   294	
   295		sub_msg_code = gen_cfg_sub_msg_code(true, pos);
   296		ub_msg_pkt_header_init(&req_pkt.header, uent, CFG_MSG_PLD_SIZE,
   297				       code_gen(UB_MSG_CODE_CFG, sub_msg_code,
   298								MSG_REQ), false);
   299	
   300		ub_msg_pkt_req_init(uent, size, pos, val,
   301				    &req_pkt.req_payload);
   302	
   303		message_info_init(&info, uent, &req_pkt, NULL,
   304				  (MSG_CFG_PKT_SIZE << MSG_REQ_SIZE_OFFSET) |
   305				   MSG_CFG_PKT_SIZE);
   306		return message_send(uent->message->mdev, &info,
   307				    req_pkt.header.msgetah.code);
   308	}
   309	
 > 310	int __ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
   311	{
   312		if (!uent || !uent->message || !uent->message->mdev || !val) {
   313			pr_err("uent or message or mdev is null\n");
   314			return -EINVAL;
   315		}
   316	
   317		return ub_sync_cfg(uent, (u8)sizeof(u8), pos, false, (u32 *)val);
   318	}
   319	
 > 320	int __ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
   321	{
   322		if (!uent || !uent->message || !uent->message->mdev || !val) {
   323			pr_err("uent or message or mdev is null\n");
   324			return -EINVAL;
   325		}
   326	
   327		return ub_sync_cfg(uent, (u8)sizeof(u16), pos, false, (u32 *)val);
   328	}
   329	
 > 330	int __ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
   331	{
   332		if (!uent || !uent->message || !uent->message->mdev || !val) {
   333			pr_err("uent or message or mdev is null\n");
   334			return -EINVAL;
   335		}
   336	
   337		return ub_sync_cfg(uent, (u8)sizeof(u32), pos, false, val);
   338	}
   339	
 > 340	int __ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
   341	{
   342		if (!uent || !uent->message || !uent->message->mdev) {
   343			pr_err("uent or message or mdev is null\n");
   344			return -EINVAL;
   345		}
   346	
   347		return ub_sync_cfg(uent, (u8)sizeof(u8), pos, true, (u32 *)&val);
   348	}
   349	
 > 350	int __ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
   351	{
   352		if (!uent || !uent->message || !uent->message->mdev) {
   353			pr_err("uent or message or mdev is null\n");
   354			return -EINVAL;
   355		}
   356	
   357		return ub_sync_cfg(uent, (u8)sizeof(u16), pos, true, (u32 *)&val);
   358	}
   359	
 > 360	int __ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)
   361	{
   362		if (!uent || !uent->message || !uent->message->mdev) {
   363			pr_err("uent or message or mdev is null\n");
   364			return -EINVAL;
   365		}
   366	
   367		return ub_sync_cfg(uent, (u8)sizeof(u32), pos, true, (u32 *)&val);
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
