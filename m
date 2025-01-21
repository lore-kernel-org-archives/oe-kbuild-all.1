Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC641F37CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472678; cv=none; b=T73xzRzdY/77aESE7iMBYrdGCK/rA2LADFYiJt+v05p2y3l217E0GyrqYymVwN89y7t0uMisMP+Kjnf8w+/g9hXYgaaSMx2mgPOJ7TiZ/nwE8jw8qxqTaxazOnzLog3zed74HhiHu1jz1nw8ARoZ7AipTSP3T+AffQ8cisggNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472678; c=relaxed/simple;
	bh=pXFidHS9nt2X/8XfmY3Jus1XTGc6ql1DeTTPscs39M4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqGm7PY0Va0UaVIOFugIexu17W2idzR+CEXp+7qBFX9Y7gB78i8RPcS20YojBbZNb5GWGj5XGILIlQAehYwN7Pljbo7SHz8EPihjjBiPqwclmlCatHuAmxWw+0ZL+3odTJI9rHwl8Dtv04eZFeKfvB63126EYpxEus+kL0iI3sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYbvhL0f; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYbvhL0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737472675; x=1769008675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pXFidHS9nt2X/8XfmY3Jus1XTGc6ql1DeTTPscs39M4=;
  b=eYbvhL0fFtADactyZNruOeOQXI3loypK+EpSvarbrvJcbclYWdJQOWUz
   v1z9SFXNj7OgUTNCfgV95QUQnacBkdtDB0ooz/VzJMaKCgVVPm+28eHQ0
   qg0LW1KeXJrlWLi9B3Z5gtkJMX6vx+DbK1rJPCyOtwqSSH2pMRiJ2rt2l
   wHDv3nDO9JvAs6BmuwD6ksIa6+/vgusNMJ31xFCD/M6CmiBUOX6noDVD/
   8dyTY97UlwQwMjBKGyP4EnI9jbJ2cC+XqTGOQP8addybmWW528kBogkZ8
   B5TYE8dbVSR3yQR2or5xgg1EtclP6uCt9FUXSVHPo130JJO4dTTVkG0zH
   A==;
X-CSE-ConnectionGUID: Pp+pUU8DQ9ehlZMZhC0JGA==
X-CSE-MsgGUID: LK1vZZn5Rx2RnuMSu2nJmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38135665"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="38135665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 07:17:55 -0800
X-CSE-ConnectionGUID: u/50LTAFQjW3gOBr58ohMg==
X-CSE-MsgGUID: gOZhF6rzToSImSa+vXSPaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111459959"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2025 07:17:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taG0k-000YCd-2A;
	Tue, 21 Jan 2025 15:17:50 +0000
Date: Tue, 21 Jan 2025 23:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 9413/10009] sound/usb/fcp.c:267:17: sparse:
 sparse: cast to restricted __le16
Message-ID: <202501212331.SaePSmsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f066b5a6c7a06adfb666b7652cc99b4ff264f4ed
commit: 46757a3e7d50dac923888e7fbe68377736f13c70 [9413/10009] ALSA: FCP: Add Focusrite Control Protocol driver
config: sparc64-randconfig-r122-20250121 (https://download.01.org/0day-ci/archive/20250121/202501212331.SaePSmsA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250121/202501212331.SaePSmsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501212331.SaePSmsA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/fcp.c:267:17: sparse: sparse: cast to restricted __le16
>> sound/usb/fcp.c:267:17: sparse: sparse: cast from restricted __le32
>> sound/usb/fcp.c:267:17: sparse: sparse: cast to restricted __le16
>> sound/usb/fcp.c:267:17: sparse: sparse: cast from restricted __le32
>> sound/usb/fcp.c:267:17: sparse: sparse: cast to restricted __le16
>> sound/usb/fcp.c:267:17: sparse: sparse: cast from restricted __le32
>> sound/usb/fcp.c:267:17: sparse: sparse: cast to restricted __le16
>> sound/usb/fcp.c:267:17: sparse: sparse: cast from restricted __le32
>> sound/usb/fcp.c:415:43: sparse: sparse: cast to restricted __le32
>> sound/usb/fcp.c:415:43: sparse: sparse: cast to restricted __le32
>> sound/usb/fcp.c:415:43: sparse: sparse: cast to restricted __le32
>> sound/usb/fcp.c:415:43: sparse: sparse: cast to restricted __le32
>> sound/usb/fcp.c:415:43: sparse: sparse: cast to restricted __le32
>> sound/usb/fcp.c:415:43: sparse: sparse: cast to restricted __le32
>> sound/usb/fcp.c:890:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   sound/usb/fcp.c:890:22: sparse:     expected restricted __poll_t ( *poll )( ... )
   sound/usb/fcp.c:890:22: sparse:     got unsigned int ( * )( ... )

vim +267 sound/usb/fcp.c

   177	
   178	/* Send an FCP command and get the response */
   179	static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
   180			   const void *req_data, u16 req_size,
   181			   void *resp_data, u16 resp_size)
   182	{
   183		struct fcp_data *private = mixer->private_data;
   184		struct usb_device *dev = mixer->chip->dev;
   185		struct fcp_usb_packet *req __free(kfree) = NULL;
   186		struct fcp_usb_packet *resp __free(kfree) = NULL;
   187		size_t req_buf_size = struct_size(req, data, req_size);
   188		size_t resp_buf_size = struct_size(resp, data, resp_size);
   189		int retries = 0;
   190		const int max_retries = 5;
   191		int err;
   192	
   193		if (!mixer->urb)
   194			return -ENODEV;
   195	
   196		req = kmalloc(req_buf_size, GFP_KERNEL);
   197		if (!req)
   198			return -ENOMEM;
   199	
   200		resp = kmalloc(resp_buf_size, GFP_KERNEL);
   201		if (!resp)
   202			return -ENOMEM;
   203	
   204		/* build request message */
   205		fcp_fill_request_header(private, req, opcode, req_size);
   206		if (req_size)
   207			memcpy(req->data, req_data, req_size);
   208	
   209		/* send the request and retry on EPROTO */
   210	retry:
   211		err = fcp_usb_tx(dev, private->bInterfaceNumber, req, req_buf_size);
   212		if (err == -EPROTO && ++retries <= max_retries) {
   213			msleep(1 << (retries - 1));
   214			goto retry;
   215		}
   216	
   217		if (err != req_buf_size) {
   218			usb_audio_err(mixer->chip,
   219				      "FCP request %08x failed: %d\n", opcode, err);
   220			return -EINVAL;
   221		}
   222	
   223		if (!wait_for_completion_timeout(&private->cmd_done,
   224						 msecs_to_jiffies(1000))) {
   225			usb_audio_err(mixer->chip,
   226				      "FCP request %08x timed out\n", opcode);
   227	
   228			return -ETIMEDOUT;
   229		}
   230	
   231		/* send a second message to get the response */
   232		err = fcp_usb_rx(dev, private->bInterfaceNumber, resp, resp_buf_size);
   233	
   234		/* validate the response */
   235	
   236		if (err < 0) {
   237	
   238			/* ESHUTDOWN and EPROTO are valid responses to a
   239			 * reboot request
   240			 */
   241			if (opcode == FCP_USB_REBOOT &&
   242			    (err == -ESHUTDOWN || err == -EPROTO))
   243				return 0;
   244	
   245			usb_audio_err(mixer->chip,
   246				      "FCP read response %08x failed: %d\n",
   247				      opcode, err);
   248			return -EINVAL;
   249		}
   250	
   251		if (err < sizeof(*resp)) {
   252			usb_audio_err(mixer->chip,
   253				      "FCP response %08x too short: %d\n",
   254				      opcode, err);
   255			return -EINVAL;
   256		}
   257	
   258		if (req->seq != resp->seq) {
   259			usb_audio_err(mixer->chip,
   260				      "FCP response %08x seq mismatch %d/%d\n",
   261				      opcode,
   262				      le16_to_cpu(req->seq), le16_to_cpu(resp->seq));
   263			return -EINVAL;
   264		}
   265	
   266		if (req->opcode != resp->opcode) {
 > 267			usb_audio_err(mixer->chip,
   268				      "FCP response %08x opcode mismatch %08x\n",
   269				      opcode, le16_to_cpu(resp->opcode));
   270			return -EINVAL;
   271		}
   272	
   273		if (resp->error) {
   274			usb_audio_err(mixer->chip,
   275				      "FCP response %08x error %d\n",
   276				      opcode, le32_to_cpu(resp->error));
   277			return -EINVAL;
   278		}
   279	
   280		if (err != resp_buf_size) {
   281			usb_audio_err(mixer->chip,
   282				      "FCP response %08x buffer size mismatch %d/%zu\n",
   283				      opcode, err, resp_buf_size);
   284			return -EINVAL;
   285		}
   286	
   287		if (resp_size != le16_to_cpu(resp->size)) {
   288			usb_audio_err(mixer->chip,
   289				      "FCP response %08x size mismatch %d/%d\n",
   290				      opcode, resp_size, le16_to_cpu(resp->size));
   291			return -EINVAL;
   292		}
   293	
   294		if (resp_data && resp_size > 0)
   295			memcpy(resp_data, resp->data, resp_size);
   296	
   297		return 0;
   298	}
   299	
   300	static int fcp_reinit(struct usb_mixer_interface *mixer)
   301	{
   302		struct fcp_data *private = mixer->private_data;
   303		void *step0_resp __free(kfree) = NULL;
   304		void *step2_resp __free(kfree) = NULL;
   305	
   306		if (mixer->urb)
   307			return 0;
   308	
   309		step0_resp = kmalloc(private->step0_resp_size, GFP_KERNEL);
   310		if (!step0_resp)
   311			return -ENOMEM;
   312		step2_resp = kmalloc(private->step2_resp_size, GFP_KERNEL);
   313		if (!step2_resp)
   314			return -ENOMEM;
   315	
   316		return fcp_init(mixer, step0_resp, step2_resp);
   317	}
   318	
   319	/*** Control Functions ***/
   320	
   321	/* helper function to create a new control */
   322	static int fcp_add_new_ctl(struct usb_mixer_interface *mixer,
   323				   const struct snd_kcontrol_new *ncontrol,
   324				   int index, int channels, const char *name,
   325				   struct snd_kcontrol **kctl_return)
   326	{
   327		struct snd_kcontrol *kctl;
   328		struct usb_mixer_elem_info *elem;
   329		int err;
   330	
   331		elem = kzalloc(sizeof(*elem), GFP_KERNEL);
   332		if (!elem)
   333			return -ENOMEM;
   334	
   335		/* We set USB_MIXER_BESPOKEN type, so that the core USB mixer code
   336		 * ignores them for resume and other operations.
   337		 * Also, the head.id field is set to 0, as we don't use this field.
   338		 */
   339		elem->head.mixer = mixer;
   340		elem->control = index;
   341		elem->head.id = 0;
   342		elem->channels = channels;
   343		elem->val_type = USB_MIXER_BESPOKEN;
   344	
   345		kctl = snd_ctl_new1(ncontrol, elem);
   346		if (!kctl) {
   347			kfree(elem);
   348			return -ENOMEM;
   349		}
   350		kctl->private_free = snd_usb_mixer_elem_free;
   351	
   352		strscpy(kctl->id.name, name, sizeof(kctl->id.name));
   353	
   354		err = snd_usb_mixer_add_control(&elem->head, kctl);
   355		if (err < 0)
   356			return err;
   357	
   358		if (kctl_return)
   359			*kctl_return = kctl;
   360	
   361		return 0;
   362	}
   363	
   364	/*** Level Meter Control ***/
   365	
   366	static int fcp_meter_ctl_info(struct snd_kcontrol *kctl,
   367				      struct snd_ctl_elem_info *uinfo)
   368	{
   369		struct usb_mixer_elem_info *elem = kctl->private_data;
   370	
   371		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
   372		uinfo->count = elem->channels;
   373		uinfo->value.integer.min = 0;
   374		uinfo->value.integer.max = 4095;
   375		uinfo->value.integer.step = 1;
   376		return 0;
   377	}
   378	
   379	static int fcp_meter_ctl_get(struct snd_kcontrol *kctl,
   380				     struct snd_ctl_elem_value *ucontrol)
   381	{
   382		struct usb_mixer_elem_info *elem = kctl->private_data;
   383		struct usb_mixer_interface *mixer = elem->head.mixer;
   384		struct fcp_data *private = mixer->private_data;
   385		int num_meter_slots, resp_size;
   386		u32 *resp = private->meter_levels;
   387		int i, err = 0;
   388	
   389		struct {
   390			__le16 pad;
   391			__le16 num_meters;
   392			__le32 magic;
   393		} __packed req;
   394	
   395		guard(mutex)(&private->mutex);
   396	
   397		err = fcp_reinit(mixer);
   398		if (err < 0)
   399			return err;
   400	
   401		num_meter_slots = private->num_meter_slots;
   402		resp_size = num_meter_slots * sizeof(u32);
   403	
   404		req.pad = 0;
   405		req.num_meters = cpu_to_le16(num_meter_slots);
   406		req.magic = cpu_to_le32(FCP_USB_METER_LEVELS_GET_MAGIC);
   407		err = fcp_usb(mixer, FCP_USB_GET_METER,
   408			      &req, sizeof(req), resp, resp_size);
   409		if (err < 0)
   410			return err;
   411	
   412		/* copy & translate from resp[] using meter_level_map[] */
   413		for (i = 0; i < elem->channels; i++) {
   414			int idx = private->meter_level_map[i];
 > 415			int value = idx < 0 ? 0 : le32_to_cpu(resp[idx]);
   416	
   417			ucontrol->value.integer.value[i] = value;
   418		}
   419	
   420		return 0;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
