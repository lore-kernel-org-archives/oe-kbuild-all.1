Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BCD208CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732901856; cv=none; b=GiR10pIR+GNdhvNT97oU0c53OaDRn36h7RIKM+pidxsF6xRK0bnIAnYJowhfHN1k+XoQWLS4a2csL+RGxW4wjRCo6IYaaFxpMN5etuzuZEQIgArU4+kgLN2H7Md7/LNvhU57/pupCJnDrUPYsmiq7pv2G3w08gU2lwBIjncqwRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732901856; c=relaxed/simple;
	bh=XBjn4iq9qEIBBjS9cwcxo35rReBV4Pbo9LbdyGTKtVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VDlrRdaf6Ww81G28p3onoLy498n3WplGtoeb4pt70viv1qp3rps7D+hY3sYH2OiO4lIvdNzNe7tyjnpTLQEL0jmfmNpeGN/dnLUl0Rj55sim3Ak7dtQyISbVi1IGtILF2kCkFjyzspHj+pSvNgSBlKwAR0/0PnTlc86P+YwNIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdngOLSe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdngOLSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732901855; x=1764437855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBjn4iq9qEIBBjS9cwcxo35rReBV4Pbo9LbdyGTKtVc=;
  b=SdngOLSeiZMG/qSddskg9VwPMNhjUR/+4e60FNJDuPILjzcyz4LpqaD9
   +AQYaFVG7nyGR/xzwwa89npJ88rASkXXaPi1n22S/WtkTse3oH7KvVd4h
   uXpPrz5IfzqZi8a90cxVdVO3IHS3aqcZkF6SjPB+a1T+NzJCopHzQwLTb
   sdbEGZLnVhynyz3cNB3E0ng8Yb3tEKRhtRUN5ufudo+ZJgjORums3G+/D
   vCd+Uy9yl5SB0o/oVgOOaVBM6C0jXoHreXC1awOLzlj7CeQtsM2+Suv3E
   0bORBpcwW5GCK+fFbHstYMEmR0kxFvA6HkYgd+qmWhGkUWCgseQI1pnEv
   g==;
X-CSE-ConnectionGUID: 2XVrQ+r8SRuGAJtTT/S8Uw==
X-CSE-MsgGUID: x9JQk+mGTcCa5vvDNF3Cmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="50543725"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="50543725"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 09:37:34 -0800
X-CSE-ConnectionGUID: LkpIP/StREikihE/rFeAZQ==
X-CSE-MsgGUID: 3aLBKnz1R5S/inKoypU4CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92855492"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2024 09:37:33 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH4vr-0000Zj-0p;
	Fri, 29 Nov 2024 17:37:31 +0000
Date: Sat, 30 Nov 2024 01:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 6/10] sound/core/ump.c:1259:69: warning: '%s'
 directive output may be truncated writing up to 11 bytes into a region of
 size between 4 and 22
Message-ID: <202411300103.FrGuTAYp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   9b5f8ee43e48c25fbe1a10163ec04343d750acd0
commit: e29e504e7890b9ee438ca6370d0180d607c473f9 [6/10] ALSA: ump: Indicate the inactive group in legacy substream names
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241130/202411300103.FrGuTAYp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300103.FrGuTAYp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300103.FrGuTAYp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/ump.c: In function 'fill_substream_names':
>> sound/core/ump.c:1259:69: warning: '%s' directive output may be truncated writing up to 11 bytes into a region of size between 4 and 22 [-Wformat-truncation=]
    1259 |                 snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
         |                                                                     ^~
   sound/core/ump.c:1259:17: note: 'snprintf' output between 11 and 40 bytes into a destination of size 32
    1259 |                 snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1260 |                          idx + 1, name,
         |                          ~~~~~~~~~~~~~~
    1261 |                          ump->groups[idx].active ? "" : " [Inactive]");
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1259 sound/core/ump.c

  1246	
  1247	static void fill_substream_names(struct snd_ump_endpoint *ump,
  1248					 struct snd_rawmidi *rmidi, int dir)
  1249	{
  1250		struct snd_rawmidi_substream *s;
  1251		const char *name;
  1252		int idx;
  1253	
  1254		list_for_each_entry(s, &rmidi->streams[dir].substreams, list) {
  1255			idx = ump->legacy_mapping[s->number];
  1256			name = ump->groups[idx].name;
  1257			if (!*name)
  1258				name = ump->info.name;
> 1259			snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
  1260				 idx + 1, name,
  1261				 ump->groups[idx].active ? "" : " [Inactive]");
  1262		}
  1263	}
  1264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
