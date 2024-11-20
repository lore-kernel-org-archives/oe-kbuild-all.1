Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C53C3C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 04:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732076870; cv=none; b=FQcWlZZTxOPLdZNlQucQ2rKG+2aBhOEYi7RhBBxYqgeKs7Lawgsg/ZqJsjR6gee/+WPMZZi5pUluvIJewETeZBeVW9Rcdrmuc7KV0gaFntjzjCzS2iRpfvr8vpwcvcKV5wASi14dAUmopFaBTAO5NgAjpi/7mUSkTfoqYJiT/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732076870; c=relaxed/simple;
	bh=WkNvkN/yEughE8gnfxCCR1wXOtVC6psKTGQfQHIqrzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFEQuTrqLQEhJpXPRSNn7gj/WkKm/0T7zyv8a/ZP8yCHK6CXGHF+DqUTqYR687XrTzxZzIu7uQieo3Pzfdh/hRN53lmUHKQZj/1uf9KPZFEMByU6toQUrtixIJ85gmuJ4YB85PFH3Ni71TBfwGTCFknSH/Coi9XT5PKwFZzEBqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEiL99pA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEiL99pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732076868; x=1763612868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WkNvkN/yEughE8gnfxCCR1wXOtVC6psKTGQfQHIqrzE=;
  b=WEiL99pAF+01Gmopelbbo6OwwazERG+j5iyJcbYU3Oc8g94GCIVgpy+/
   rOCvI94GOwc8POu3BxjwfUiy1TFd9jFJX81ymJ3W2j2Z0DL+WpBgzyee1
   Z5WzWgQ+AoUFiF64EnL63n0runqGQBEQ+n5DAmLxa75qPgoMOWJSXc7CA
   WvVRLiGWQxokkAZv+pswai5Yrik0DkGBdC9ASbixNWt4UehNwCYOukrrl
   ufXZii0gbcypiC39ngDVufQ9aZhFA8EFSZQKMbENFRgIY7y/6iI6Gv9Yk
   FQauPzfnXuDvt+e44REJ0EqEsAHT3sColCm9fW2PxcPeXVs2oVVhLCqw6
   Q==;
X-CSE-ConnectionGUID: f0tU1jGbQ1+83L0PpJrWhw==
X-CSE-MsgGUID: o3v4J2LvS0aA1LiNuEqH1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31516126"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31516126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 20:27:48 -0800
X-CSE-ConnectionGUID: K23YFJQwQ+G3dnRWRYvAuQ==
X-CSE-MsgGUID: gK92bRjIT9unxEas9owBlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="127331216"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2024 20:27:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDcJb-0000U1-2E;
	Wed, 20 Nov 2024 04:27:43 +0000
Date: Wed, 20 Nov 2024 12:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Rahul Pathak <rpathak@ventanamicro.com>
Subject: [avpatel:riscv_sbi_mpxy_mailbox_v1 4/5]
 drivers/mailbox/riscv-sbi-mpxy-mbox.c:314:39: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202411201258.O0IHgw28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_mpxy_mailbox_v1
head:   9ae4957182e0a227b451e9bb2bdda5d58e47c0c8
commit: ac4dc1f410db8b2f82f2b390e98bace044cad778 [4/5] mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
config: riscv-randconfig-r121-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201258.O0IHgw28-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241120/202411201258.O0IHgw28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201258.O0IHgw28-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:314:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] remaining @@     got unsigned int [usertype] @@
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:314:39: sparse:     expected restricted __le32 [usertype] remaining
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:314:39: sparse:     got unsigned int [usertype]
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:315:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] returned @@     got unsigned int [usertype] @@
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:315:38: sparse:     expected restricted __le32 [usertype] returned
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:315:38: sparse:     got unsigned int [usertype]
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:316:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lost @@     got unsigned int [usertype] @@
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:316:34: sparse:     expected restricted __le32 [usertype] lost
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:316:34: sparse:     got unsigned int [usertype]
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:317:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] reserved @@     got unsigned int [usertype] @@
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:317:38: sparse:     expected restricted __le32 [usertype] reserved
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:317:38: sparse:     got unsigned int [usertype]
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:495:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] event_datalen @@     got unsigned short [usertype] @@
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:495:38: sparse:     expected restricted __le16 [usertype] event_datalen
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:495:38: sparse:     got unsigned short [usertype]
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:497:52: sparse: sparse: restricted __le16 degrades to integer

vim +314 drivers/mailbox/riscv-sbi-mpxy-mbox.c

   295	
   296	static int mpxy_get_notifications(u32 channel_id,
   297					  struct sbi_mpxy_notification_data *notif_data,
   298					  unsigned long *events_data_len)
   299	{
   300		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   301		struct sbiret sret;
   302	
   303		if (!mpxy->shmem_active)
   304			return -ENODEV;
   305		if (!notif_data || !events_data_len)
   306			return -EINVAL;
   307	
   308		get_cpu();
   309	
   310		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
   311				 channel_id, 0, 0, 0, 0, 0);
   312		if (!sret.error) {
   313			memcpy(notif_data, mpxy->shmem, sret.value);
 > 314			notif_data->remaining = le32_to_cpu(notif_data->remaining);
 > 315			notif_data->returned =  le32_to_cpu(notif_data->returned);
 > 316			notif_data->lost =  le32_to_cpu(notif_data->lost);
 > 317			notif_data->reserved =  le32_to_cpu(notif_data->reserved);
   318			*events_data_len = sret.value - 16;
   319		}
   320	
   321		put_cpu();
   322		return sbi_err_map_linux_errno(sret.error);
   323	}
   324	
   325	static int mpxy_cleanup_shmem(unsigned int cpu)
   326	{
   327		struct mpxy_local *mpxy;
   328		struct sbiret sret;
   329	
   330		mpxy = per_cpu_ptr(&mpxy_local, cpu);
   331		if (!mpxy->shmem_active)
   332			return -EINVAL;
   333	
   334		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SET_SHMEM,
   335				 0, -1U, -1U, 0, 0, 0);
   336		if (sret.error)
   337			return sbi_err_map_linux_errno(sret.error);
   338	
   339		free_pages((unsigned long)mpxy->shmem, get_order(MPXY_SHMEM_SIZE));
   340	
   341		mpxy->shmem = NULL;
   342		mpxy->shmem_phys_addr = 0;
   343		mpxy->shmem_active = false;
   344	
   345		return 0;
   346	}
   347	
   348	static int mpxy_setup_shmem(unsigned int cpu)
   349	{
   350		struct page *shmem_page;
   351		struct mpxy_local *mpxy;
   352		struct sbiret sret;
   353	
   354		mpxy = per_cpu_ptr(&mpxy_local, cpu);
   355		if (mpxy->shmem_active)
   356			return -EINVAL;
   357	
   358		shmem_page = alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(MPXY_SHMEM_SIZE));
   359		if (!shmem_page)
   360			return -ENOMEM;
   361	
   362		/*
   363		 * Linux setup of shmem is done in mpxy OVERWRITE mode.
   364		 * flags[1:0] = 00b
   365		 */
   366		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SET_SHMEM,
   367				 MPXY_SHMEM_SIZE, page_to_phys(shmem_page), 0, 0, 0, 0);
   368		if (sret.error) {
   369			free_pages((unsigned long)page_to_virt(shmem_page),
   370				   get_order(MPXY_SHMEM_SIZE));
   371			return sbi_err_map_linux_errno(sret.error);
   372		}
   373	
   374		mpxy->shmem = page_to_virt(shmem_page);
   375		mpxy->shmem_phys_addr = page_to_phys(shmem_page);
   376		mpxy->shmem_active = true;
   377	
   378		return 0;
   379	}
   380	
   381	/* ====== MPXY mailbox data structures ====== */
   382	
   383	/* MPXY mailbox channel */
   384	struct mpxy_mbox_channel {
   385		struct mpxy_mbox *mbox;
   386		u32 channel_id;
   387		struct sbi_mpxy_channel_attrs attrs;
   388		struct sbi_mpxy_rpmi_channel_attrs rpmi_attrs;
   389		struct sbi_mpxy_notification_data *notif;
   390		u32 max_xfer_len;
   391		bool have_events_state;
   392		u32 msi_index;
   393		u32 msi_irq;
   394		bool started;
   395	};
   396	
   397	/* MPXY mailbox */
   398	struct mpxy_mbox {
   399		struct device *dev;
   400		u32 channel_count;
   401		struct mpxy_mbox_channel *channels;
   402		u32 msi_count;
   403		struct mpxy_mbox_channel **msi_index_to_channel;
   404		struct mbox_controller controller;
   405	};
   406	
   407	/* ====== MPXY RPMI processing ====== */
   408	
   409	static int mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
   410					    struct rpmi_mbox_message *msg)
   411	{
   412		int rc = 0;
   413	
   414		switch (msg->type) {
   415		case RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE:
   416			switch (msg->attr.id) {
   417			case RPMI_MBOX_ATTR_SPEC_VERSION:
   418				msg->attr.value = mchan->attrs.msg_proto_version;
   419				break;
   420			case RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE:
   421				msg->attr.value = mchan->max_xfer_len;
   422				break;
   423			case RPMI_MBOX_ATTR_SERVICEGROUP_ID:
   424				msg->attr.value = mchan->rpmi_attrs.servicegroup_id;
   425				break;
   426			case RPMI_MBOX_ATTR_SERVICEGROUP_VERSION:
   427				msg->attr.value = mchan->rpmi_attrs.servicegroup_version;
   428				break;
   429			default:
   430				rc = -ENOTSUPP;
   431				break;
   432			}
   433			break;
   434		case RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE:
   435			/* None of the RPMI linux mailbox attributes are writeable */
   436			rc = -ENOTSUPP;
   437			break;
   438		case RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE:
   439			if ((!msg->data.request && msg->data.request_len) ||
   440			    (msg->data.request &&
   441			     (msg->data.request_len > mchan->max_xfer_len)) ||
   442			    (!msg->data.response && msg->data.max_response_len)) {
   443				rc = -EINVAL;
   444				break;
   445			}
   446			if (!(mchan->attrs.capability & SBI_MPXY_CHAN_CAP_SEND_WITH_RESP)) {
   447				rc = -EIO;
   448				break;
   449			}
   450			rc = mpxy_send_message_with_resp(mchan->channel_id,
   451							 msg->data.service_id,
   452							 msg->data.request,
   453							 msg->data.request_len,
   454							 msg->data.response,
   455							 msg->data.max_response_len,
   456							 &msg->data.out_response_len);
   457			break;
   458		case RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE:
   459			if ((!msg->data.request && msg->data.request_len) ||
   460			    (msg->data.request &&
   461			     (msg->data.request_len > mchan->max_xfer_len))) {
   462				rc = -EINVAL;
   463				break;
   464			}
   465			if (!(mchan->attrs.capability & SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP)) {
   466				rc = -EIO;
   467				break;
   468			}
   469			rc = mpxy_send_message_without_resp(mchan->channel_id,
   470							    msg->data.service_id,
   471							    msg->data.request,
   472							    msg->data.request_len);
   473			break;
   474		default:
   475			rc = -ENOTSUPP;
   476			break;
   477		}
   478	
   479		msg->error = rc;
   480		return 0;
   481	}
   482	
   483	static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
   484					     struct mpxy_mbox_channel *mchan,
   485					     struct sbi_mpxy_notification_data *notif,
   486					     unsigned long events_data_len)
   487	{
   488		struct rpmi_notification_event *event;
   489		unsigned long pos = 0, event_size;
   490		struct rpmi_mbox_message msg;
   491	
   492		while ((pos < events_data_len) && !(pos & 0x3) &&
   493		       ((events_data_len - pos) <= sizeof(*event))) {
   494			event = (struct rpmi_notification_event *)(notif->events_data + pos);
 > 495			event->event_datalen = le16_to_cpu(event->event_datalen);
   496	
 > 497			event_size = sizeof(*event) + event->event_datalen;
   498			if (event_size > (events_data_len - pos)) {
   499				event_size = events_data_len - pos;
   500				goto skip_event;
   501			}
   502			if (event_size & 0x3)
   503				goto skip_event;
   504	
   505			msg.type = RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT;
   506			msg.notif_event = event;
   507			msg.error = 0;
   508			mbox_chan_received_data(chan, &msg);
   509	
   510	skip_event:
   511			pos += event_size;
   512		}
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
