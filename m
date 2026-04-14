Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA11231C91
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 19:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776195969; cv=none; b=ZJXNBc+Bp5w3l6s2LG9Gmygb2aJ9kcUu1dkPuX+f32uYMiAiEDhL3CKHXt65KNDxv1Y/zMi+1XSMK7+pQhQp8S7MyAqSj4IiEzdUhxtvckpNBDN+BVNQRU42Ru9d1df35r97z8Ju7uCZWSK4cPleoTB4mjbn/d+uM2YS+nrT/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776195969; c=relaxed/simple;
	bh=UdUqxsVtfF5/ltuqMrp9q/Bv4VfU0ME9i2DhuQapVIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xrh98s9EMT3DpkBh66od/bwRQWTwvpiBZOlLDmQZ6/FZNeeO3RWaovt0Hv/qa/NKG344gXEWxnkSxk5VJQbaDOhTvwxRIOeEbVAOlWbcxsnAjrPdPluj9JvFUhvwuLEiKQxo8gReTGrRG83uwlMOSybF9WPrIeuVZKNyNqYdzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzc2EcFq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzc2EcFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776195967; x=1807731967;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UdUqxsVtfF5/ltuqMrp9q/Bv4VfU0ME9i2DhuQapVIg=;
  b=nzc2EcFqb4oBit3vzoQzIgtZYabS+OWl5XlosqzuX0KdBgXbHpRcmXmR
   CtNejF7tPVBMMWnU/nJ+9YnBTaOTrDnVfB8sU7//rGmbsjpjhAIniJb0T
   ZvBPaWRIKTQxwRWWvehQ4xYmOgL3DlHR7QMC4OSkG47ZwQPSX1GWqnpEN
   0LFOE71Ha2oDmiGF/xGRYKwiaJbAxnxtDlNkGf8kbMISHu+42BCAWSxOe
   JhnOnX0jx+ND8BKt8tkBYHsbog6wDr57d2FFZVERUUbU//pyV+fVe0nvW
   dqKbprZinZy9Yxpmxn7Z89uy6s+k+EPAOfRSEGyAtPGTusMz12nBdbstZ
   Q==;
X-CSE-ConnectionGUID: TMBG7stwSmajumPLg80Rdg==
X-CSE-MsgGUID: 43oTjRBARtKepnJAxJSRCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77346969"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77346969"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 12:46:07 -0700
X-CSE-ConnectionGUID: P4DQ7AzgTF2ebKlON7yysg==
X-CSE-MsgGUID: BJ0PeGOdRwKWzVjXS04Szg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230113865"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2026 12:46:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCjhz-000000000Tp-0ZhU;
	Tue, 14 Apr 2026 19:46:03 +0000
Date: Tue, 14 Apr 2026 21:45:28 +0200
From: kernel test robot <lkp@intel.com>
To: "Pablo Martin-Gomez" <pmartin-gomez@freebox.fr>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/ieee80211-eht.h:1138:25: error:
 'IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_256US' undeclared; did you mean
 'IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
Message-ID: <202604142114.voFsUkre-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Pablo-Martin-Gomez/w=
ifi-Remove-invalid-128TU-transition-timeout-constant/20260413-194835
head:   61f7ec5db10fc67eca270c36d5d0a305ad4ae302
commit: 274ef51c760e8aa7814ed480bcc56ee6fbdd546a wifi: Rename EMLSR delay c=
onstants and add EMLMR helpers and definitions
date:   32 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/202604=
14/202604142114.voFsUkre-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260414/202604142114.voFsUkre-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142114.voFsUkre-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ieee80211.h:2851,
                    from include/net/cfg80211.h:23,
                    from net/wireless/core.c:26:
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlsr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1138:25: error: 'IEEE80211_EML_CAP_EMLSR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1138 |             pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h:1138:25: note: each undeclared identifier =
is reported only once for each function it appears in
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1188:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1188 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
>> include/linux/ieee80211-eht.h:1200:25: error: 'IEEE80211_EML_CAP_EMLMR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1200 |             pad_delay > IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_trans_delay_=
in_us':
   include/linux/ieee80211-eht.h:1218:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1218 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
--
   In file included from include/linux/ieee80211.h:2851,
                    from include/net/mac80211.h:20,
                    from net/mac80211/driver-ops.h:12,
                    from net/mac80211/eht.c:8:
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlsr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1138:25: error: 'IEEE80211_EML_CAP_EMLSR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1138 |             pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h:1138:25: note: each undeclared identifier =
is reported only once for each function it appears in
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1188:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1188 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
>> include/linux/ieee80211-eht.h:1200:25: error: 'IEEE80211_EML_CAP_EMLMR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1200 |             pad_delay > IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_trans_delay_=
in_us':
   include/linux/ieee80211-eht.h:1218:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1218 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
   net/mac80211/eht.c: In function 'ieee80211_rx_eml_op_mode_notif':
>> net/mac80211/eht.c:207:29: error: 'IEEE80211_EML_CAP_EMLSR_PADDING_DELAY=
_256US' undeclared (first use in this function); did you mean 'IEEE80211_EM=
L_CAP_EML_PADDING_DELAY_256US'?
     207 |                             IEEE80211_EML_CAP_EMLSR_PADDING_DELA=
Y_256US)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
         |                             IEEE80211_EML_CAP_EML_PADDING_DELAY_=
256US
--
   In file included from include/linux/ieee80211.h:2851,
                    from include/net/mac80211.h:20,
                    from drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:=
16:
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlsr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1138:25: error: 'IEEE80211_EML_CAP_EMLSR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1138 |             pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h:1138:25: note: each undeclared identifier =
is reported only once for each function it appears in
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1188:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1188 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
>> include/linux/ieee80211-eht.h:1200:25: error: 'IEEE80211_EML_CAP_EMLMR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1200 |             pad_delay > IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_trans_delay_=
in_us':
   include/linux/ieee80211-eht.h:1218:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1218 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c: At top level:
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:266:34: error: 'IEEE80=
211_EML_CAP_EMLSR_PADDING_DELAY_32US' undeclared here (not in a function); =
did you mean 'IEEE80211_EML_CAP_EML_PADDING_DELAY_32US'?
     266 |                                  IEEE80211_EML_CAP_EMLSR_PADDING=
_DELAY_32US << \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:282:37: note: in expan=
sion of macro 'IWL_MVM_EMLSR_CAPA'
     282 |                 .eml_capabilities =3D IWL_MVM_EMLSR_CAPA,
         |                                     ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/ieee80211.h:2851,
                    from include/net/mac80211.h:20,
                    from drivers/net/wireless/realtek/rtw89/core.h:14,
                    from drivers/net/wireless/realtek/rtw89/cam.h:8,
                    from drivers/net/wireless/realtek/rtw89/fw.c:6:
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlsr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1138:25: error: 'IEEE80211_EML_CAP_EMLSR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1138 |             pad_delay > IEEE80211_EML_CAP_EMLSR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h:1138:25: note: each undeclared identifier =
is reported only once for each function it appears in
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_pad_delay_in=
_us':
>> include/linux/ieee80211-eht.h:1188:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1188 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
>> include/linux/ieee80211-eht.h:1200:25: error: 'IEEE80211_EML_CAP_EMLMR_P=
ADDING_DELAY_256US' undeclared (first use in this function); did you mean '=
IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    1200 |             pad_delay > IEEE80211_EML_CAP_EMLMR_PADDING_DELAY_25=
6US)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
         |                         IEEE80211_EML_CAP_EML_PADDING_DELAY_256US
   include/linux/ieee80211-eht.h: In function 'ieee80211_emlmr_trans_delay_=
in_us':
   include/linux/ieee80211-eht.h:1218:39: error: 'IEEE80211_EML_CAP_EMLMR_S=
UPP' undeclared (first use in this function); did you mean 'IEEE80211_EML_C=
AP_EMLSR_SUPP'?
    1218 |                 u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLMR_SU=
PP);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
         |                                       IEEE80211_EML_CAP_EMLSR_SU=
PP
   drivers/net/wireless/realtek/rtw89/fw.c: In function 'rtw89_fw_h2c_join_=
info':
>> drivers/net/wireless/realtek/rtw89/fw.c:5053:39: error: 'IEEE80211_EML_C=
AP_EMLSR_PADDING_DELAY_256US' undeclared (first use in this function); did =
you mean 'IEEE80211_EML_CAP_EML_PADDING_DELAY_256US'?
    5053 |                      le32_encode_bits(IEEE80211_EML_CAP_EMLSR_PA=
DDING_DELAY_256US,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
         |                                       IEEE80211_EML_CAP_EML_PADD=
ING_DELAY_256US


vim +1138 include/linux/ieee80211-eht.h

86bc0c662322b4 Johannes Berg      2025-11-05  1113 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1114  /**
86bc0c662322b4 Johannes Berg      2025-11-05  1115   * ieee80211_emlsr_pad_=
delay_in_us - Fetch the EMLSR Padding delay
86bc0c662322b4 Johannes Berg      2025-11-05  1116   *	in microseconds
86bc0c662322b4 Johannes Berg      2025-11-05  1117   * @eml_cap: EML capabi=
lities field value from common info field of
86bc0c662322b4 Johannes Berg      2025-11-05  1118   *	the Multi-link eleme=
nt
86bc0c662322b4 Johannes Berg      2025-11-05  1119   * Return: the EMLSR Pa=
dding delay (in microseconds) encoded in the
86bc0c662322b4 Johannes Berg      2025-11-05  1120   *	EML Capabilities fie=
ld
86bc0c662322b4 Johannes Berg      2025-11-05  1121   */
86bc0c662322b4 Johannes Berg      2025-11-05  1122 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1123  static inline u32 ieee8=
0211_emlsr_pad_delay_in_us(u16 eml_cap)
86bc0c662322b4 Johannes Berg      2025-11-05  1124  {
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1125  	u32 emlsr_supp =3D
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1126  		u16_get_bits(eml_cap,=
 IEEE80211_EML_CAP_EMLSR_SUPP);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1127 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1128  	if (!emlsr_supp)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1129  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1130 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1131  	/* IEEE Std 802.11be-2=
024 Table 9-417i=E2=80=94Encoding of the EMLSR
86bc0c662322b4 Johannes Berg      2025-11-05  1132  	 * Padding Delay subfi=
eld.
86bc0c662322b4 Johannes Berg      2025-11-05  1133  	 */
86bc0c662322b4 Johannes Berg      2025-11-05  1134  	u32 pad_delay =3D u16_=
get_bits(eml_cap,
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1135  				     IEEE80211_EML_=
CAP_EML_PADDING_DELAY);
86bc0c662322b4 Johannes Berg      2025-11-05  1136 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1137  	if (!pad_delay ||
86bc0c662322b4 Johannes Berg      2025-11-05 @1138  	    pad_delay > IEEE80=
211_EML_CAP_EMLSR_PADDING_DELAY_256US)
86bc0c662322b4 Johannes Berg      2025-11-05  1139  		return 0;
86bc0c662322b4 Johannes Berg      2025-11-05  1140 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1141  	return 32 * (1 << (pad=
_delay - 1));
86bc0c662322b4 Johannes Berg      2025-11-05  1142  }
86bc0c662322b4 Johannes Berg      2025-11-05  1143 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1144  /**
86bc0c662322b4 Johannes Berg      2025-11-05  1145   * ieee80211_emlsr_tran=
s_delay_in_us - Fetch the EMLSR Transition
86bc0c662322b4 Johannes Berg      2025-11-05  1146   *	delay in microseconds
86bc0c662322b4 Johannes Berg      2025-11-05  1147   * @eml_cap: EML capabi=
lities field value from common info field of
86bc0c662322b4 Johannes Berg      2025-11-05  1148   *	the Multi-link eleme=
nt
86bc0c662322b4 Johannes Berg      2025-11-05  1149   * Return: the EMLSR Tr=
ansition delay (in microseconds) encoded in the
86bc0c662322b4 Johannes Berg      2025-11-05  1150   *	EML Capabilities fie=
ld
86bc0c662322b4 Johannes Berg      2025-11-05  1151   */
86bc0c662322b4 Johannes Berg      2025-11-05  1152 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1153  static inline u32 ieee8=
0211_emlsr_trans_delay_in_us(u16 eml_cap)
86bc0c662322b4 Johannes Berg      2025-11-05  1154  {
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1155  	u32 emlsr_supp =3D
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1156  		u16_get_bits(eml_cap,=
 IEEE80211_EML_CAP_EMLSR_SUPP);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1157 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1158  	if (!emlsr_supp)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1159  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1160 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1161  	/* IEEE Std 802.11be-2=
024 Table 9-417j=E2=80=94Encoding of the EMLSR
86bc0c662322b4 Johannes Berg      2025-11-05  1162  	 * Transition Delay su=
bfield.
86bc0c662322b4 Johannes Berg      2025-11-05  1163  	 */
86bc0c662322b4 Johannes Berg      2025-11-05  1164  	u32 trans_delay =3D
86bc0c662322b4 Johannes Berg      2025-11-05  1165  		u16_get_bits(eml_cap,
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1166  			     IEEE80211_EML_C=
AP_EML_TRANSITION_DELAY);
86bc0c662322b4 Johannes Berg      2025-11-05  1167 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1168  	/* invalid values also=
 just use 0 */
86bc0c662322b4 Johannes Berg      2025-11-05  1169  	if (!trans_delay ||
86bc0c662322b4 Johannes Berg      2025-11-05  1170  	    trans_delay > IEEE=
80211_EML_CAP_EMLSR_TRANSITION_DELAY_256US)
86bc0c662322b4 Johannes Berg      2025-11-05  1171  		return 0;
86bc0c662322b4 Johannes Berg      2025-11-05  1172 =20
86bc0c662322b4 Johannes Berg      2025-11-05  1173  	return 16 * (1 << (tra=
ns_delay - 1));
86bc0c662322b4 Johannes Berg      2025-11-05  1174  }
86bc0c662322b4 Johannes Berg      2025-11-05  1175 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1176  /**
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1177   * ieee80211_emlmr_pad_=
delay_in_us - Fetch the EMLMR Padding delay
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1178   *	in microseconds
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1179   * @eml_cap: EML capabi=
lities field value from common info field of
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1180   *	the Multi-link eleme=
nt
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1181   * Return: the EMLMR Pa=
dding delay (in microseconds) encoded in the
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1182   *	EML Capabilities fie=
ld
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1183   */
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1184 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1185  static inline u32 ieee8=
0211_emlmr_pad_delay_in_us(u16 eml_cap)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1186  {
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1187  	u32 emlmr_supp =3D
274ef51c760e8a Pablo Martin-Gomez 2026-04-09 @1188  		u16_get_bits(eml_cap,=
 IEEE80211_EML_CAP_EMLMR_SUPP);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1189 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1190  	if (!emlmr_supp)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1191  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1192 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1193  	/* IEEE Std 802.11be-2=
024 Table 9-417k=E2=80=94Encoding of the EMLMR
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1194  	 * Padding Delay subfi=
eld.
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1195  	 */
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1196  	u32 pad_delay =3D u16_=
get_bits(eml_cap,
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1197  				     IEEE80211_EML_=
CAP_EML_PADDING_DELAY);
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1198 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1199  	if (!pad_delay ||
274ef51c760e8a Pablo Martin-Gomez 2026-04-09 @1200  	    pad_delay > IEEE80=
211_EML_CAP_EMLMR_PADDING_DELAY_256US)
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1201  		return 0;
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1202 =20
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1203  	return 32 * (1 << (pad=
_delay - 1));
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1204  }
274ef51c760e8a Pablo Martin-Gomez 2026-04-09  1205 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
