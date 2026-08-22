Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A39248867
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386233; cv=none; b=EsbEkeQVv4eja20iHWvL0kPTIOoq1MpbwTYPykF95jujV4G048qgOtIGiPgucQohDSNIMYyFB3T+xv7OeffvmEIF9sjXqr8+v2ernRNAl6SaO8ixsc0vl2UXZF2dH6ROLZpASumuX7wUcKz3d5/vyWMfOyG2dsmADHKAqI314IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386233; c=relaxed/simple;
	bh=GzsnqybtEeIEXRxD1/jQsF/biSfYAhhrHp4FnmH5LNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=q4ZlD9HYaurxeM9LWPUHnxVunbVoTksOZoPVDsi70zztEo5INyowMXsdouXdrpb2VSQsr/EMqMEvcY71540m0+iaPlP+zhyUA5wWBn0QUBRpH8/ntte4vtWsMHXlunteBQZ5vtrrJxccihQGz3ItDGi+iNBza5oiu3KdwgcWPeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZ64EWHJ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ64EWHJ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1674460f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787386230; x=1787991030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WLIOyN5e+42p5FHJTXJ2LgHUHUABa7KAUy5fhDC4CY=;
        b=fZ64EWHJfOYM6xa5ihl/sGkXOmShM2gLAh9honGld7itg92aD+RL9VFjrZwUP5xd8X
         thCfgYd0YKLff/8VVDqU0K0JO4ODGRz/1coPkBh6ax/Tf9PkCpW1OPx+/dLU8bJ590cQ
         Sm7PZ7IK1WjtanJAEug2/7ONf3gJ4tjLkwdUoIi38q/eznR0uiwhyyspxRzyq7S+rGHc
         k9uWGgJoLALu1ToAsGWkWlyewMtgkOtoizLVfg9JMym0AUaRi9wo/3r7190TBDapFdrr
         inVqNRvulCGGrG/ccTlNfNSJ+jROmD5US9UWKJ+ngZ/aMLCkUA3/fTb77wY0ebW+Jpgz
         nJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386230; x=1787991030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WLIOyN5e+42p5FHJTXJ2LgHUHUABa7KAUy5fhDC4CY=;
        b=UcwpxdN7F5uzyAiYCCnsIThPpuqUyAjsFzEOnaZI5IOZHXUE+FsQKx77gJvil3Z1aB
         GrgUdGpLO2YZ+W0pjVs8BiBHq8ZZhKhmpBcdT49ZeUehaCg+pwjZE9IhLjI02lGzAIJx
         xY+foPkuGAG3fHbmbu1+XFdy5KeemY7sjHSzMaOvrWFe9DwOW/ssS43wA3cLo+e0VqGc
         42NsaAWrWDzr5IMrTjfy7pRxTkUS2qhzBtYs4kmZ6BFJhB/v60W/UWmK911LVN0pE7HS
         +WHjIkBTqUTmkutgcrlCyWU4hVzM6vlR3LnNPdtizWQ7GJ7WoUx8xc3SXKnNFCoOrbVn
         eicw==
X-Forwarded-Encrypted: i=1; AHgh+RqeZxe+M9oL4t0O4msSHFIgIwPI2mt3PsJ5Z2kPQJaojgTTCHAbxhE7LJDlWAH//av1VxvFm/p8Apz+hXA7@lists.linux.dev
X-Gm-Message-State: AFuF++kC7VFKvSGUX8kkbqMLg5wBOFp+qzRnDIbQhmzrNjTikfwJZana
	H7lcPOEJ+OtHZMZwuq37sATC9rAUlfC3J1KeNtzNdPFcrubKrOmRD2Bu
X-Gm-Gg: AR+sD13RKaCXmh5Zrnvp3vWlTd1G91dCT78cW/THZ+50sReveYpOQJNOlL3JBXzV2XX
	HCXuyVYs+mMJGnBDJzVh77c/Z6x1L7atwPsIHML7gYex/UMqGlpqGNy6igiUTcV7A+DFcmO/iC4
	bxQGvyc33Ncf4S67og5j/nQ9qRA7uyM4/HyseYErHKxpwKk6k2JcXGLEfCxJDymeF3tgXaUmfYl
	awamIiObr4mcx/dMwsAQ4cJLPElNyBFGf11kd/hv2jrdfvTpAGKPetXZv+nWZWSQYT96QuIUQ+g
	S6pJtLHlB7YcQ85Mii6WhtAEwGfcdnz+2gZHf+h8dATXf8ALoiJOFlYZ5yGzWVOpfvE1Ykd0p/A
	JCtmx4Gh1+vtu/H3xuDrLEOiTA32ThdGCVvMerPQyFgxOOmP+konTkZ8uQfWulVfstXVfqQw4E2
	xNc/+Nya8fZFpyS6Ps69fA25yHmEkmE9Lb/Kj9eFKa6/eH0sckPhP6/M1K
X-Received: by 2002:a05:6000:27c4:b0:482:c678:72d3 with SMTP id ffacd0b85a97d-482c67873d2mr5600177f8f.15.1787386229786;
        Sat, 22 Aug 2026 01:10:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9a9f145sm1423683f8f.0.2026.08.22.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:10:29 -0700 (PDT)
Date: Sat, 22 Aug 2026 11:10:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Hilda Wu <hildawu@realtek.com>,
	marcel@holtmann.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	alex_lu@realsil.com.cn, jason_mao@realsil.com.cn,
	zoey_zhou@realsil.com.cn, max.chou@realtek.com, kidman@realtek.com
Subject: Re: [PATCH v6] Bluetooth: btrtl: Add firmware format v3 support
Message-ID: <202608221220.dvi7OT84-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814065920.413487-1-hildawu@realtek.com>

Hi Hilda,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hilda-Wu/Bluetooth-btrtl-Add-firmware-format-v3-support/20260814-145920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20260814065920.413487-1-hildawu%40realtek.com
patch subject: [PATCH v6] Bluetooth: btrtl: Add firmware format v3 support
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260822/202608221220.dvi7OT84-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608221220.dvi7OT84-lkp@intel.com/

New smatch warnings:
drivers/bluetooth/btrtl.c:1106 btrtl_free() warn: variable dereferenced before check 'btrtl_dev' (see line 1098)

Old smatch warnings:
drivers/bluetooth/btrtl.c:1326 btrtl_initialize() warn: passing zero to 'ERR_PTR'

vim +/btrtl_dev +1106 drivers/bluetooth/btrtl.c

26503ad25de8c7c Martin Blumenstingl 2018-08-02  1094  void btrtl_free(struct btrtl_device_info *btrtl_dev)
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1095  {
9a24ce5e29b15c4 Max Chou            2023-04-17  1096  	struct rtl_subsection *entry, *tmp;
9a24ce5e29b15c4 Max Chou            2023-04-17  1097  
268d3636dfb2225 Alice Mikityanska   2020-01-24 @1098  	kvfree(btrtl_dev->fw_data);
268d3636dfb2225 Alice Mikityanska   2020-01-24  1099  	kvfree(btrtl_dev->cfg_data);
9a24ce5e29b15c4 Max Chou            2023-04-17  1100  
9a24ce5e29b15c4 Max Chou            2023-04-17  1101  	list_for_each_entry_safe(entry, tmp, &btrtl_dev->patch_subsecs, list) {
9a24ce5e29b15c4 Max Chou            2023-04-17  1102  		list_del(&entry->list);
9a24ce5e29b15c4 Max Chou            2023-04-17  1103  		kfree(entry);
9a24ce5e29b15c4 Max Chou            2023-04-17  1104  	}
9a24ce5e29b15c4 Max Chou            2023-04-17  1105  
8e4d5e1dbe2345c Hilda Wu            2026-08-14 @1106  	if (btrtl_dev) {

No point in checking for NULL when we have already dereferenced
btrtl_dev so many times.

8e4d5e1dbe2345c Hilda Wu            2026-08-14  1107  		struct btrtl_enh_ops *ops = symbol_get(rtl_enh_ops);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1108  
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1109  		if (ops) {
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1110  			if (ops->free_patch_images)
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1111  				ops->free_patch_images(btrtl_dev);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1112  			symbol_put(rtl_enh_ops);
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1113  		}
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1114  	}
8e4d5e1dbe2345c Hilda Wu            2026-08-14  1115  
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1116  	kfree(btrtl_dev);
26503ad25de8c7c Martin Blumenstingl 2018-08-02  1117  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

