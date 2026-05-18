Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215073859EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 05:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081291; cv=none; b=WMLtAvmq2WNTUVqMzh7l8ZYRzYNb8V9+r56SlZ37Ts/8/WfYBNsVJMGXKJ0fz1CFGIwImuCqEJD8eNFk7SPzk2PJiI6N2NEHfKVr5PcbfYlEeAU5mt4eUoeeQr+Ri4JhNoUTRjBh/RUCOcqebxXgxwdhsffsijrYxgKEx0RWL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081291; c=relaxed/simple;
	bh=q+Ye1t5MieuYxH22YzdFlQI/46Lvk1vTTDVqN5sfU6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJC0DZJCtadgsIchdRg++L8iG5XBX4aj35nHCwezo4O4HKPe/Zbe3zKB9jlg6qqIMMlluMV0wwW2SGXMMOz95ZlSFUV92E339PM7ZCS5Kf+g/AuFF9vV9UDRYKjHTJvQIw7Ew0tRUTzJw/cWTmTKROfOhaXcSkaOF+SqV9GsBVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRu591CI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRu591CI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-459bf19e87bso907203f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 22:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779081288; x=1779686088; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H++yyYpAtfeJ9r0MHoxydujiVZmkWKLBHrn4zymlxUQ=;
        b=TRu591CIiJtgt7aDusuhHHDiLrpLOCTtn9xO/6d97u+irQ04iT0GG//4N28mT9lnxu
         GKfm9X9hfB9nXnu0QigXr3kBDDTDB2vfs9RC9uW/oas9UMI+NXmnwfyuFfBy9ymDxeJG
         ni6pAe84Q/MZlLoQcwbpSJPJLAETcYJtBsQMuFWrpemxfvCnUChgHT6jVagDoZS5lhVg
         nyoShysc9POYJt5edQ8KGalhtjKT+g99Qs/lyMgmGO8Uz56E0dEp5s4/SLjaLSCKnB3r
         ea9D0cVJVEaufmVKE3Zdw/Wp90DyT6KZBREMesGqEyMnWqgryMsPNTVghViTDZTSEOF5
         qblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779081288; x=1779686088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H++yyYpAtfeJ9r0MHoxydujiVZmkWKLBHrn4zymlxUQ=;
        b=Qxjs1prHWDlScBhr2qVCIPxQ3M0rUPnVQVakV5FQAz14Y/o1jlZlV7ODZocEv2ZgeP
         jcC70ly6MYuy7UYkzqzMWXgSvWGzxKxE1azHJ2TY/e8H+zKOtTqrMdxKChDXWWF5m9wa
         9jdPtfRSZP7Pby8vov6GoYrxF0dag7TELGShdu9aWQRfFlYX/w4iDQPtUim0CMgGsgRo
         oQaEAp3EwAavpUGjWlzF+cA0UHhraqKuGAOb9Pobv6h8yh41DSjlrSvMcdLz+YqPaj4N
         o6D3UvkRll9d70kUowXE1xJgxSlruRnyxSP5DgO6jl9oHmEo8agUJEyBGaw5xLItvBJH
         lfqg==
X-Forwarded-Encrypted: i=1; AFNElJ+/T8WLuHM62ve37giGfftsxRj8gD1YKU/TrHw+kGtEEOYz45O2PrtcxIBNGggQwYJzc/OiLs5WTo1zBu7D@lists.linux.dev
X-Gm-Message-State: AOJu0YyyrS1O8nVLxMpSF7/w+owll1QcyY+DZ9EmL2ct5MeDHqcFN3ZO
	5n5UeadNby4qvm2RZ0XEcdf9OWPTbeFwu2fxfo33DtQd7Fy7esb4ze2X
X-Gm-Gg: Acq92OHbVJc3uL4Sh0DnjE9CSdzbXd1ZArn+uDhD0yqIZNKMKLMgmFEKstiLqxr7N7H
	ZqbRTb5kLswiJTL8zbCKXL/yiSDgPdodqRKlJZngNZYW9nT+BHt9j1bOufJBKzgjkc5ZQpuTVM6
	fdgwnYiNREive3fo7tNdQVCjtFZkrs9tfh6GOu+v+wYdDn+nGsWDk1dw6YA5isvgC89NW6E5tjM
	TaG76GEBTXjeAGMl0+Vgl64IgQlJm5+8xmhSBvNmyBfpYDu7nJDwzOTpdcHWAT7sc1RR7PE4h0b
	6UR1nTKUyYkxaP4so+cYvT219Z2M0yie35jDkFbp4yLcs/ezrrMpD6VPdCTcgv4gDVAySwNyhqH
	yAYbK0s2IeZoKMBsqd/dEQmqNka9Dy3ADi+ozUcCDvrS1cvzlLofFar+OYYWkna8qkJA9Bv3AIn
	ALepZ4DFYpziuzS6XTvus=
X-Received: by 2002:a05:6000:25c6:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-45e5c57d4bcmr20956905f8f.2.1779081288513;
        Sun, 17 May 2026 22:14:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm33188911f8f.2.2026.05.17.22.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:14:47 -0700 (PDT)
Date: Mon, 18 May 2026 08:14:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	lkp <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"Berg, Johannes" <johannes.berg@intel.com>
Subject: Re: [iwlwifi-next:next 13/93]
 drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
 variable dereferenced before check 'mld_sta' (see line 565)
Message-ID: <agqgRaXY5OSEDzSh@stanley.mountain>
References: <202605171045.6jPun4QF-lkp@intel.com>
 <DS0PR11MB788062B175A1E6833DA8EC31A3032@DS0PR11MB7880.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB788062B175A1E6833DA8EC31A3032@DS0PR11MB7880.namprd11.prod.outlook.com>

On Mon, May 18, 2026 at 05:11:00AM +0000, Korenblit, Miriam Rachel wrote:
> 
> 
> > -----Original Message-----
> > From: Dan Carpenter <error27@gmail.com>
> > Sent: Monday, May 18, 2026 8:03 AM
> > To: oe-kbuild@lists.linux.dev; Korenblit, Miriam Rachel
> > <miriam.rachel.korenblit@intel.com>
> > Cc: lkp <lkp@intel.com>; oe-kbuild-all@lists.linux.dev; Berg, Johannes
> > <johannes.berg@intel.com>
> > Subject: [iwlwifi-next:next 13/93] drivers/net/wireless/intel/iwlwifi/mld/tx.c:571
> > iwl_mld_fill_tx_cmd() warn: variable dereferenced before check 'mld_sta' (see
> > line 565)
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
> > next
> > head:   ce2b645bb3099ef4d96759335271e25875202ce9
> > commit: d751c944055aedf33a6cab9b1cadaab65d7bc8dd [13/93] wifi: iwlwifi:
> > mld: use host rate for NAN management frames
> > config: i386-randconfig-141-20260517 (https://download.01.org/0day-
> > ci/archive/20260517/202605171045.6jPun4QF-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project
> > 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > smatch: v0.5.0-9185-gbcc58b9c
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of the
> > same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202605171045.6jPun4QF-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/net/wireless/intel/iwlwifi/mld/tx.c:571 iwl_mld_fill_tx_cmd() warn:
> > variable dereferenced before check 'mld_sta' (see line 565)
> > 
> > vim +/mld_sta +571 drivers/net/wireless/intel/iwlwifi/mld/tx.c
> > 
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  538  static void
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  539  iwl_mld_fill_tx_cmd(struct
> > iwl_mld *mld, struct sk_buff *skb,
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  540  		    struct
> > iwl_device_tx_cmd *dev_tx_cmd,
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  541  		    struct
> > ieee80211_sta *sta)
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  542  {
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  543  	struct
> > ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  544  	struct ieee80211_hdr
> > *hdr = (void *)skb->data;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  545  	struct iwl_mld_sta
> > *mld_sta = sta ? iwl_mld_sta_from_mac80211(sta) :
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  546
> > 		    NULL;
> > 1c97c73cdab0afc Miri Korenblit 2025-05-11  547  	struct iwl_tx_cmd
> > *tx_cmd;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  548  	bool amsdu =
> > ieee80211_is_data_qos(hdr->frame_control) &&
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  549
> > (*ieee80211_get_qos_ctl(hdr) &
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  550
> > IEEE80211_QOS_CTL_A_MSDU_PRESENT);
> > dabc88cb3b78c0d Johannes Berg  2025-05-05  551  	__le32 rate_n_flags =
> > 0;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  552  	u16 flags = 0;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  553
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  554  	dev_tx_cmd->hdr.cmd
> > = TX_CMD;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  555
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  556  	if (!info-
> > >control.hw_key)
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  557  		flags |=
> > IWL_TX_FLAGS_ENCRYPT_DIS;
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  558
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  559  	/* For data and mgmt
> > packets rate info comes from the fw.
> > d751c944055aedf Miri Korenblit 2026-05-10  560  	 * Only set
> > rate/antenna for:
> > d751c944055aedf Miri Korenblit 2026-05-10  561  	 * - injected frames
> > with fixed rate,
> > d751c944055aedf Miri Korenblit 2026-05-10  562  	 * - when no sta is
> > given.
> > d751c944055aedf Miri Korenblit 2026-05-10  563  	 * - frames that are
> > sent to an NMI sta, which is only used for management.
> > d1e879ec600f9b3 Miri Korenblit 2025-02-16  564  	 */
> > d751c944055aedf Miri Korenblit 2026-05-10 @565  	if (unlikely(!sta ||
> > mld_sta->vif->type == NL80211_IFTYPE_NAN ||
> >                                                                              ^^^^^^^^^^^^^^^^^^ Dereference
> 
> 
> This is not a real issue because (sta != NULL) -> (mld_sta != NULL)
> 

You could delete the other NULL check then.  The checker just wants
it to be consistent.

regards,
dan carpenter

