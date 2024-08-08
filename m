Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255B8208DA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723143910; cv=none; b=jP8mvQ5dQJPyEFwpkGBdbIt8prAAkiTNs61f+fIQAqK0ymyFtb2jiSk8TG6qX24DvXXdQQcNsk8zWe8zmZh6TDYoEyK2ffjIrtq4wiNPXkbYWNQm33MSaJi2rfCh1cZJqEm51X37VUYALFw0PmCuxqb9CB4xdSynDAcY2+O7yQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723143910; c=relaxed/simple;
	bh=88kqA2LB4Y5ZC7+l2L5/pNLYxx72q6rZWQZAF4V0JVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fUrEUzyAIZE41k61tGsQsH0jj4aNKlBR/XLmxgnOOUr3Fb+p4P7Fa5Ay9pxNrW2C67ADaeEYuLsGcIsKu0iULeXWNJ1ly4zlQB0t60YtTQLaiTDm53qU4s9AJED7xX+3+8DgayOosfRDoMJ+hH2nbExsvVQIlzVC//grF/Orcqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq/bFE9N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lq/bFE9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723143908; x=1754679908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=88kqA2LB4Y5ZC7+l2L5/pNLYxx72q6rZWQZAF4V0JVw=;
  b=Lq/bFE9NWd2MRrMRWJPHm3tAX7DTPJE0Id5XrCyudnyBMvZtg8xBggDf
   1yJKJ8ltWHDmLVCfMCXiUe8EAMFixmjgEhhX441Rj3RC9yZxmdZzHr00u
   GirgdeSclgQbIWp+PwD72zRQ+mET98rPLihUV1xITxN7QwP8/c4ty5GFj
   JKE2QqLUTqKtia9USXLtGcu6R0CclnYw9K78EOWob0K99UbDz4vN5dowC
   uH8GH7a7G0BWZPfMNh1ZWqtu2+K0sjLf4qUnz3GiIPtg1NbXVglP8tDVP
   VvTSvCI11cZD6QKzMeMaUzv1F+DYda1uWWar4rwELYKPZ17/Cs/EOI1vD
   g==;
X-CSE-ConnectionGUID: D6v4oxhuSR2wAndJzPd6Jg==
X-CSE-MsgGUID: 2kD7S4SJTPS0QpwI2eut4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21454901"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21454901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 12:05:05 -0700
X-CSE-ConnectionGUID: M4cHM3vlSRK5dHcRb1DrwA==
X-CSE-MsgGUID: qFfm1S+aRKC2OTBZ+BGagg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="62277976"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2024 12:05:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc8RZ-0006R0-2F;
	Thu, 08 Aug 2024 19:05:01 +0000
Date: Fri, 9 Aug 2024 03:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 66/82] sound/usb/usx2y/usb_stream.c:668:17:
 warning: variable 'iters' set but not used
Message-ID: <202408090249.8LE9qrae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   e95b9f7f2ee05bbef3bf6a4cd7da6e887f17f652
commit: f8466d91f36d97e237ea1b3c6f19de980054a1b6 [66/82] ALSA: usx2y: Use standard print API
config: x86_64-randconfig-161-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090249.8LE9qrae-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090249.8LE9qrae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090249.8LE9qrae-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/usb/usx2y/us122l.c:15:
>> sound/usb/usx2y/usb_stream.c:668:17: warning: variable 'iters' set but not used [-Wunused-but-set-variable]
     668 |         int frame = 0, iters = 0;
         |                        ^
   1 warning generated.


vim +/iters +668 sound/usb/usx2y/usb_stream.c

030a07e441296c Karsten Wiese 2008-07-30  664  
030a07e441296c Karsten Wiese 2008-07-30  665  int usb_stream_start(struct usb_stream_kernel *sk)
030a07e441296c Karsten Wiese 2008-07-30  666  {
030a07e441296c Karsten Wiese 2008-07-30  667  	struct usb_stream *s = sk->s;
030a07e441296c Karsten Wiese 2008-07-30 @668  	int frame = 0, iters = 0;
030a07e441296c Karsten Wiese 2008-07-30  669  	int u, err;
030a07e441296c Karsten Wiese 2008-07-30  670  	int try = 0;
030a07e441296c Karsten Wiese 2008-07-30  671  
030a07e441296c Karsten Wiese 2008-07-30  672  	if (s->state != usb_stream_stopped)
030a07e441296c Karsten Wiese 2008-07-30  673  		return -EAGAIN;
030a07e441296c Karsten Wiese 2008-07-30  674  
030a07e441296c Karsten Wiese 2008-07-30  675  	subs_set_complete(sk->inurb, i_capture_start);
030a07e441296c Karsten Wiese 2008-07-30  676  	subs_set_complete(sk->outurb, i_playback_start);
030a07e441296c Karsten Wiese 2008-07-30  677  	memset(sk->write_page, 0, s->write_size);
030a07e441296c Karsten Wiese 2008-07-30  678  dotry:
030a07e441296c Karsten Wiese 2008-07-30  679  	s->insize_done = 0;
030a07e441296c Karsten Wiese 2008-07-30  680  	s->idle_insize = 0;
030a07e441296c Karsten Wiese 2008-07-30  681  	s->idle_outsize = 0;
030a07e441296c Karsten Wiese 2008-07-30  682  	s->sync_packet = -1;
030a07e441296c Karsten Wiese 2008-07-30  683  	s->inpacket_head = -1;
030a07e441296c Karsten Wiese 2008-07-30  684  	sk->iso_frame_balance = 0;
030a07e441296c Karsten Wiese 2008-07-30  685  	++try;
030a07e441296c Karsten Wiese 2008-07-30  686  	for (u = 0; u < 2; u++) {
030a07e441296c Karsten Wiese 2008-07-30  687  		struct urb *inurb = sk->inurb[u];
030a07e441296c Karsten Wiese 2008-07-30  688  		struct urb *outurb = sk->outurb[u];
4c0a58ef36f3de Takashi Iwai  2021-05-17  689  
030a07e441296c Karsten Wiese 2008-07-30  690  		playback_prep_freqn(sk, outurb);
030a07e441296c Karsten Wiese 2008-07-30  691  		inurb->number_of_packets = outurb->number_of_packets;
030a07e441296c Karsten Wiese 2008-07-30  692  		inurb->transfer_buffer_length =
030a07e441296c Karsten Wiese 2008-07-30  693  			inurb->number_of_packets *
030a07e441296c Karsten Wiese 2008-07-30  694  			inurb->iso_frame_desc[0].length;
d0f3a2eb906256 Karsten Wiese 2011-12-30  695  
030a07e441296c Karsten Wiese 2008-07-30  696  		if (u == 0) {
030a07e441296c Karsten Wiese 2008-07-30  697  			int now;
030a07e441296c Karsten Wiese 2008-07-30  698  			struct usb_device *dev = inurb->dev;
4c0a58ef36f3de Takashi Iwai  2021-05-17  699  
030a07e441296c Karsten Wiese 2008-07-30  700  			frame = usb_get_current_frame_number(dev);
030a07e441296c Karsten Wiese 2008-07-30  701  			do {
030a07e441296c Karsten Wiese 2008-07-30  702  				now = usb_get_current_frame_number(dev);
030a07e441296c Karsten Wiese 2008-07-30  703  				++iters;
030a07e441296c Karsten Wiese 2008-07-30  704  			} while (now > -1 && now == frame);
030a07e441296c Karsten Wiese 2008-07-30  705  		}
030a07e441296c Karsten Wiese 2008-07-30  706  		err = usb_submit_urb(inurb, GFP_ATOMIC);
030a07e441296c Karsten Wiese 2008-07-30  707  		if (err < 0) {
f8466d91f36d97 Takashi Iwai  2024-08-07  708  			dev_err(&sk->dev->dev,
f8466d91f36d97 Takashi Iwai  2024-08-07  709  				"%s: usb_submit_urb(sk->inurb[%i]) returned %i\n",
f8466d91f36d97 Takashi Iwai  2024-08-07  710  				__func__, u, err);
030a07e441296c Karsten Wiese 2008-07-30  711  			return err;
030a07e441296c Karsten Wiese 2008-07-30  712  		}
030a07e441296c Karsten Wiese 2008-07-30  713  		err = usb_submit_urb(outurb, GFP_ATOMIC);
030a07e441296c Karsten Wiese 2008-07-30  714  		if (err < 0) {
f8466d91f36d97 Takashi Iwai  2024-08-07  715  			dev_err(&sk->dev->dev,
f8466d91f36d97 Takashi Iwai  2024-08-07  716  				"%s: usb_submit_urb(sk->outurb[%i]) returned %i\n",
f8466d91f36d97 Takashi Iwai  2024-08-07  717  				__func__, u, err);
030a07e441296c Karsten Wiese 2008-07-30  718  			return err;
030a07e441296c Karsten Wiese 2008-07-30  719  		}
d0f3a2eb906256 Karsten Wiese 2011-12-30  720  
030a07e441296c Karsten Wiese 2008-07-30  721  		if (inurb->start_frame != outurb->start_frame) {
f8466d91f36d97 Takashi Iwai  2024-08-07  722  			dev_dbg(&sk->dev->dev,
f8466d91f36d97 Takashi Iwai  2024-08-07  723  				"%s: u[%i] start_frames differ in:%u out:%u\n",
f8466d91f36d97 Takashi Iwai  2024-08-07  724  				__func__, u, inurb->start_frame, outurb->start_frame);
030a07e441296c Karsten Wiese 2008-07-30  725  			goto check_retry;
030a07e441296c Karsten Wiese 2008-07-30  726  		}
030a07e441296c Karsten Wiese 2008-07-30  727  	}
030a07e441296c Karsten Wiese 2008-07-30  728  	try = 0;
030a07e441296c Karsten Wiese 2008-07-30  729  check_retry:
030a07e441296c Karsten Wiese 2008-07-30  730  	if (try) {
030a07e441296c Karsten Wiese 2008-07-30  731  		usb_stream_stop(sk);
030a07e441296c Karsten Wiese 2008-07-30  732  		if (try < 5) {
030a07e441296c Karsten Wiese 2008-07-30  733  			msleep(1500);
f8466d91f36d97 Takashi Iwai  2024-08-07  734  			dev_dbg(&sk->dev->dev, "goto dotry;\n");
030a07e441296c Karsten Wiese 2008-07-30  735  			goto dotry;
030a07e441296c Karsten Wiese 2008-07-30  736  		}
f8466d91f36d97 Takashi Iwai  2024-08-07  737  		dev_warn(&sk->dev->dev,
f8466d91f36d97 Takashi Iwai  2024-08-07  738  			 "%s: couldn't start all urbs on the same start_frame.\n",
f8466d91f36d97 Takashi Iwai  2024-08-07  739  			 __func__);
030a07e441296c Karsten Wiese 2008-07-30  740  		return -EFAULT;
030a07e441296c Karsten Wiese 2008-07-30  741  	}
030a07e441296c Karsten Wiese 2008-07-30  742  
030a07e441296c Karsten Wiese 2008-07-30  743  	sk->idle_inurb = sk->inurb[USB_STREAM_NURBS - 2];
030a07e441296c Karsten Wiese 2008-07-30  744  	sk->idle_outurb = sk->outurb[USB_STREAM_NURBS - 2];
030a07e441296c Karsten Wiese 2008-07-30  745  	sk->completed_inurb = sk->inurb[USB_STREAM_NURBS - 1];
030a07e441296c Karsten Wiese 2008-07-30  746  	sk->completed_outurb = sk->outurb[USB_STREAM_NURBS - 1];
030a07e441296c Karsten Wiese 2008-07-30  747  

:::::: The code at line 668 was first introduced by commit
:::::: 030a07e441296c372f946cd4065b5d831d8dc40c ALSA: Add USB US122L driver

:::::: TO: Karsten Wiese <fzu@wemgehoertderstaat.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
