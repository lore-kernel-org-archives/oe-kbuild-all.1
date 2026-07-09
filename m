Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3C84499B4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783628369; cv=none; b=pUezcERNYMnN/gka9nmzjTTqQWl8gYo5Nwx/nlufAVbdyTTDSz4i+sOI2uqxfbisQiOZkV2Ni5TmVngCXwQM3ZIisNXP8k1lhiu6PkrZMI7EuKKGmnyv1+JBWLi3xHXdwxlsJ3ZgcZW91TcvymJdydDruVuw+4Rydf8RE7N3HFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783628369; c=relaxed/simple;
	bh=hwO8LvLTY5J5+rMpj2iZg1wlOgGUBNwMZe9c1W3BBoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UX986mY13/Zz016jeFZHCCMUnkJSw6u7do8W9hpzrHymm5FQmuE9ducPfrHySXZJeQbRwK3qa+bbupLY0db0XTUpDc6p+hXTghTzr377LXxGoC34xwCmmy7dQ0ypwM+YIpj9ZUApdHnfkmHvt79vsqcNkFOcSyQfW1KAQxOC6g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7QxIluN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7QxIluN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783628366; x=1815164366;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hwO8LvLTY5J5+rMpj2iZg1wlOgGUBNwMZe9c1W3BBoU=;
  b=b7QxIluN0E7e7i3b8tO4CFwb28KWt26GVful6QDqv9KeitpneGOHajb/
   T4Br0hGcYWaMsqYgh8TmCtRRpSS6nju1FwWfmDTMkAlb8kZD34SMTiOKS
   Mrb3Oik65+2iNC16qDL4zPaNFTBKPwf6hdsCnSRFxFStK9d56mOfEfbJr
   mtQiCzRx2sM/oxGKVcp6M/eoXFsJj/kwWY3DtFzASCUFGKfcbAlhxjczR
   ZF75tfHtqmibK07bdtFJBYX/IJVDIZj4nXPL/BX3z0D7N1srhQkcw0ae3
   qTADvBhy7uZLdqi1WkrSxjDkSEf5Awos9Tm3YMAz/2J79UN8EQgAeQ9YI
   w==;
X-CSE-ConnectionGUID: aNH9CdfIS1eJcLTRzmZEow==
X-CSE-MsgGUID: Rpf01oRvTayoRa/bSRisGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95838513"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95838513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 13:19:23 -0700
X-CSE-ConnectionGUID: hrhIhe22RPOci7wsajbslw==
X-CSE-MsgGUID: P65DKmD7RXWRHqJZanKdCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292881604"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 13:19:18 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whvDH-00000000325-2MzU;
	Thu, 09 Jul 2026 20:19:15 +0000
Date: Thu, 09 Jul 2026 22:18:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 2/2] htmldocs:
 ./include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:
          * @fbdev_probe
Message-ID: <202607092242.LXlyEgsI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-=
12
head:   c59f0172f39e77d3edc4335f973f4c7d908a0536
commit: 0e0bdcea1054037a4513415997c14be56513ef4b [2/2] docs: kdoc: handle t=
he obsolescensce of docutils.ErrorString()
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260709/202607092242.L=
XlyEgsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092242.LXlyEgsI-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   ./include/linux/i3c/master.h:317: warning: Enum value 'I3C_ADDR_SLOT_EXT=
_STATUS_MASK' not described in enum 'i3c_addr_slot_status'
   ./drivers/base/core.c:1994: warning: Excess function parameter 'con' des=
cription in '__fw_devlink_relax_cycles'
   ./fs/eventpoll.c:2061: warning: Function parameter or struct member 'ep'=
 not described in 'ep_get_upwards_depth_proc'
   ./fs/eventpoll.c:2061: warning: Function parameter or struct member 'dep=
th' not described in 'ep_get_upwards_depth_proc'
>> ./include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format=
:          * @fbdev_probe
>> ./include/drm/drm_drv.h:435: warning: Function parameter or struct membe=
r 'fbdev_probe' not described in 'drm_driver'
>> Documentation/admin-guide/media/ipu3.rst:592: WARNING: Footnote [#] is n=
ot referenced. [ref.footnote]
   Documentation/admin-guide/media/ipu3.rst:598: WARNING: Footnote [#] is n=
ot referenced. [ref.footnote]
   Documentation/admin-guide/pm/intel_pstate.rst:417: ERROR: Indirect hyper=
link target (id=3D"id7") refers to target "active mode", which is a duplica=
te, and cannot be used as a unique reference. [docutils]
   Documentation/admin-guide/pm/intel_pstate.rst:421: ERROR: Indirect hyper=
link target (id=3D"id8") refers to target "passive mode", which is a duplic=
ate, and cannot be used as a unique reference. [docutils]
   Documentation/admin-guide/pm/intel_pstate.rst:478: ERROR: Indirect hyper=
link target (id=3D"id9") refers to target "active mode", which is a duplica=
te, and cannot be used as a unique reference. [docutils]
   Documentation/admin-guide/pm/intel_pstate.rst:500: ERROR: Indirect hyper=
link target (id=3D"id10") refers to target "passive mode", which is a dupli=
cate, and cannot be used as a unique reference. [docutils]
--
   Documentation/admin-guide/pm/intel_pstate.rst:642: ERROR: Duplicate targ=
et name, cannot be used as a unique reference: "passive mode". [docutils]
   Documentation/admin-guide/pm/intel_pstate.rst:659: ERROR: Duplicate targ=
et name, cannot be used as a unique reference: "active mode". [docutils]
   Documentation/admin-guide/pm/intel_pstate.rst:663: ERROR: Duplicate targ=
et name, cannot be used as a unique reference: "passive mode". [docutils]
   Documentation/admin-guide/pm/intel_pstate.rst:706: ERROR: Duplicate targ=
et name, cannot be used as a unique reference: "active mode". [docutils]
   Documentation/admin-guide/pm/intel_pstate.rst:722: ERROR: Duplicate targ=
et name, cannot be used as a unique reference: "passive mode". [docutils]
>> Documentation/block/ublk.rst:324: WARNING: Footnote [#] is not reference=
d. [ref.footnote]
   Documentation/core-api/symbol-namespaces.rst:101: WARNING: Inline emphas=
is start-string without end-string. [docutils]
   Documentation/driver-api/usb/usb:164: ./drivers/usb/core/message.c:968: =
WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:829.
   Declaration is '.. c:function:: int usb_string (struct usb_device *dev, =
int index, char *buf, size_t size)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:372: WARNI=
NG: Duplicate C declaration, also defined at gpu/drm-kms:35.
   Declaration is '.. c:function:: const struct drm_format_info * drm_forma=
t_info (u32 format)'. [duplicate_declaration.c]
--
   The parent of level 2 sections cannot be reached. The parser is at secti=
on level 2 but the current node has only 0 parent section(s).
   One reason may be a high level section used in a directive that parses i=
ts content into a base node not attached to the document
   (up to Docutils 0.21, these sections were silently dropped). [docutils]
>> Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenc=
ed. [ref.footnote]
>> Documentation/trace/debugging.rst: WARNING: document isn't included in a=
ny toctree [toc.not_included]


vim +372 ./include/drm/drm_drv.h

85e634bce01af5 Simona Vetter           2016-11-14  170 =20
85e634bce01af5 Simona Vetter           2016-11-14  171  /**
85e634bce01af5 Simona Vetter           2016-11-14  172   * struct drm_drive=
r - DRM driver structure
85e634bce01af5 Simona Vetter           2016-11-14  173   *
60e6ecfb616f0d Luca Ceresoli           2019-03-13  174   * This structure r=
epresent the common code for a family of cards. There will be
60e6ecfb616f0d Luca Ceresoli           2019-03-13  175   * one &struct drm_=
device for each card present in this family. It contains lots
60e6ecfb616f0d Luca Ceresoli           2019-03-13  176   * of vfunc entries=
, and a pile of those probably should be moved to more
85e634bce01af5 Simona Vetter           2016-11-14  177   * appropriate plac=
es like &drm_mode_config_funcs or into a new operations
85e634bce01af5 Simona Vetter           2016-11-14  178   * structure for GE=
M drivers.
85e634bce01af5 Simona Vetter           2016-11-14  179   */
85e634bce01af5 Simona Vetter           2016-11-14  180  struct drm_driver {
56926500278250 Gabriel Krisman Bertazi 2017-01-02  181  	/**
56926500278250 Gabriel Krisman Bertazi 2017-01-02  182  	 * @load:
56926500278250 Gabriel Krisman Bertazi 2017-01-02  183  	 *
4c8e84b8876dc7 Simona Vetter           2020-09-02  184  	 * Backward-compat=
ible driver callback to complete initialization steps
4c8e84b8876dc7 Simona Vetter           2020-09-02  185  	 * after the drive=
r is registered.  For this reason, may suffer from
4c8e84b8876dc7 Simona Vetter           2020-09-02  186  	 * race conditions=
 and its use is deprecated for new drivers.  It is
4c8e84b8876dc7 Simona Vetter           2020-09-02  187  	 * therefore only =
supported for existing drivers not yet converted to
4c8e84b8876dc7 Simona Vetter           2020-09-02  188  	 * the new scheme.=
  See devm_drm_dev_alloc() and drm_dev_register() for
4c8e84b8876dc7 Simona Vetter           2020-09-02  189  	 * proper and race=
-free way to set up a &struct drm_device.
56926500278250 Gabriel Krisman Bertazi 2017-01-02  190  	 *
b93658f83fa7f8 Simona Vetter           2017-03-08  191  	 * This is depreca=
ted, do not use!
b93658f83fa7f8 Simona Vetter           2017-03-08  192  	 *
56926500278250 Gabriel Krisman Bertazi 2017-01-02  193  	 * Returns:
56926500278250 Gabriel Krisman Bertazi 2017-01-02  194  	 *
56926500278250 Gabriel Krisman Bertazi 2017-01-02  195  	 * Zero on success=
, non-zero value on failure.
56926500278250 Gabriel Krisman Bertazi 2017-01-02  196  	 */
85e634bce01af5 Simona Vetter           2016-11-14  197  	int (*load) (struc=
t drm_device *, unsigned long flags);
b93658f83fa7f8 Simona Vetter           2017-03-08  198 =20
b93658f83fa7f8 Simona Vetter           2017-03-08  199  	/**
b93658f83fa7f8 Simona Vetter           2017-03-08  200  	 * @open:
b93658f83fa7f8 Simona Vetter           2017-03-08  201  	 *
b93658f83fa7f8 Simona Vetter           2017-03-08  202  	 * Driver callback=
 when a new &struct drm_file is opened. Useful for
b93658f83fa7f8 Simona Vetter           2017-03-08  203  	 * setting up driv=
er-private data structures like buffer allocators,
b93658f83fa7f8 Simona Vetter           2017-03-08  204  	 * execution conte=
xts or similar things. Such driver-private resources
b93658f83fa7f8 Simona Vetter           2017-03-08  205  	 * must be release=
d again in @postclose.
b93658f83fa7f8 Simona Vetter           2017-03-08  206  	 *
b93658f83fa7f8 Simona Vetter           2017-03-08  207  	 * Since the displ=
ay/modeset side of DRM can only be owned by exactly
b93658f83fa7f8 Simona Vetter           2017-03-08  208  	 * one &struct drm=
_file (see &drm_file.is_master and &drm_device.master)
b93658f83fa7f8 Simona Vetter           2017-03-08  209  	 * there should ne=
ver be a need to set up any modeset related resources
b93658f83fa7f8 Simona Vetter           2017-03-08  210  	 * in this callbac=
k. Doing so would be a driver design bug.
b93658f83fa7f8 Simona Vetter           2017-03-08  211  	 *
b93658f83fa7f8 Simona Vetter           2017-03-08  212  	 * Returns:
b93658f83fa7f8 Simona Vetter           2017-03-08  213  	 *
b93658f83fa7f8 Simona Vetter           2017-03-08  214  	 * 0 on success, a=
 negative error code on failure, which will be
b93658f83fa7f8 Simona Vetter           2017-03-08  215  	 * promoted to use=
rspace as the result of the open() system call.
b93658f83fa7f8 Simona Vetter           2017-03-08  216  	 */
85e634bce01af5 Simona Vetter           2016-11-14  217  	int (*open) (struc=
t drm_device *, struct drm_file *);
b93658f83fa7f8 Simona Vetter           2017-03-08  218 =20
b93658f83fa7f8 Simona Vetter           2017-03-08  219  	/**
b93658f83fa7f8 Simona Vetter           2017-03-08  220  	 * @postclose:
b93658f83fa7f8 Simona Vetter           2017-03-08  221  	 *
b93658f83fa7f8 Simona Vetter           2017-03-08  222  	 * One of the driv=
er callbacks when a new &struct drm_file is closed.
b93658f83fa7f8 Simona Vetter           2017-03-08  223  	 * Useful for tear=
ing down driver-private data structures allocated in
b93658f83fa7f8 Simona Vetter           2017-03-08  224  	 * @open like buff=
er allocators, execution contexts or similar things.
b93658f83fa7f8 Simona Vetter           2017-03-08  225  	 *
b93658f83fa7f8 Simona Vetter           2017-03-08  226  	 * Since the displ=
ay/modeset side of DRM can only be owned by exactly
b93658f83fa7f8 Simona Vetter           2017-03-08  227  	 * one &struct drm=
_file (see &drm_file.is_master and &drm_device.master)
b93658f83fa7f8 Simona Vetter           2017-03-08  228  	 * there should ne=
ver be a need to tear down any modeset related
b93658f83fa7f8 Simona Vetter           2017-03-08  229  	 * resources in th=
is callback. Doing so would be a driver design bug.
b93658f83fa7f8 Simona Vetter           2017-03-08  230  	 */
85e634bce01af5 Simona Vetter           2016-11-14  231  	void (*postclose) =
(struct drm_device *, struct drm_file *);
b93658f83fa7f8 Simona Vetter           2017-03-08  232 =20
56926500278250 Gabriel Krisman Bertazi 2017-01-02  233  	/**
56926500278250 Gabriel Krisman Bertazi 2017-01-02  234  	 * @unload:
56926500278250 Gabriel Krisman Bertazi 2017-01-02  235  	 *
56926500278250 Gabriel Krisman Bertazi 2017-01-02  236  	 * Reverse the eff=
ects of the driver load callback.  Ideally,
56926500278250 Gabriel Krisman Bertazi 2017-01-02  237  	 * the clean up pe=
rformed by the driver should happen in the
56926500278250 Gabriel Krisman Bertazi 2017-01-02  238  	 * reverse order o=
f the initialization.  Similarly to the load
56926500278250 Gabriel Krisman Bertazi 2017-01-02  239  	 * hook, this hand=
ler is deprecated and its usage should be
56926500278250 Gabriel Krisman Bertazi 2017-01-02  240  	 * dropped in favo=
r of an open-coded teardown function at the
9a96f55034e41b Aishwarya Pant          2017-09-26  241  	 * driver layer.  =
See drm_dev_unregister() and drm_dev_put()
56926500278250 Gabriel Krisman Bertazi 2017-01-02  242  	 * for the proper =
way to remove a &struct drm_device.
56926500278250 Gabriel Krisman Bertazi 2017-01-02  243  	 *
56926500278250 Gabriel Krisman Bertazi 2017-01-02  244  	 * The unload() ho=
ok is called right after unregistering
56926500278250 Gabriel Krisman Bertazi 2017-01-02  245  	 * the device.
56926500278250 Gabriel Krisman Bertazi 2017-01-02  246  	 *
56926500278250 Gabriel Krisman Bertazi 2017-01-02  247  	 */
11b3c20bdd15d1 Gabriel Krisman Bertazi 2017-01-06  248  	void (*unload) (st=
ruct drm_device *);
f30c92576af4bb Chris Wilson            2017-02-02  249 =20
f30c92576af4bb Chris Wilson            2017-02-02  250  	/**
f30c92576af4bb Chris Wilson            2017-02-02  251  	 * @release:
f30c92576af4bb Chris Wilson            2017-02-02  252  	 *
f30c92576af4bb Chris Wilson            2017-02-02  253  	 * Optional callba=
ck for destroying device data after the final
d33b58d0115e7e Simona Vetter           2020-03-23  254  	 * reference is re=
leased, i.e. the device is being destroyed.
9e1ed9fb1eb0a4 Simona Vetter           2020-03-23  255  	 *
9e1ed9fb1eb0a4 Simona Vetter           2020-03-23  256  	 * This is depreca=
ted, clean up all memory allocations associated with a
9e1ed9fb1eb0a4 Simona Vetter           2020-03-23  257  	 * &drm_device usi=
ng drmm_add_action(), drmm_kmalloc() and related
9e1ed9fb1eb0a4 Simona Vetter           2020-03-23  258  	 * managed resourc=
es functions.
f30c92576af4bb Chris Wilson            2017-02-02  259  	 */
f30c92576af4bb Chris Wilson            2017-02-02  260  	void (*release) (s=
truct drm_device *);
f30c92576af4bb Chris Wilson            2017-02-02  261 =20
6c4789edc55d5a Simona Vetter           2016-11-14  262  	/**
6c4789edc55d5a Simona Vetter           2016-11-14  263  	 * @master_set:
6c4789edc55d5a Simona Vetter           2016-11-14  264  	 *
6c4789edc55d5a Simona Vetter           2016-11-14  265  	 * Called whenever=
 the minor master is set. Only used by vmwgfx.
6c4789edc55d5a Simona Vetter           2016-11-14  266  	 */
907f53200f982c Emil Velikov            2020-05-30  267  	void (*master_set)=
(struct drm_device *dev, struct drm_file *file_priv,
85e634bce01af5 Simona Vetter           2016-11-14  268  			   bool from_ope=
n);
6c4789edc55d5a Simona Vetter           2016-11-14  269  	/**
6c4789edc55d5a Simona Vetter           2016-11-14  270  	 * @master_drop:
6c4789edc55d5a Simona Vetter           2016-11-14  271  	 *
6c4789edc55d5a Simona Vetter           2016-11-14  272  	 * Called whenever=
 the minor master is dropped. Only used by vmwgfx.
6c4789edc55d5a Simona Vetter           2016-11-14  273  	 */
85e634bce01af5 Simona Vetter           2016-11-14  274  	void (*master_drop=
)(struct drm_device *dev, struct drm_file *file_priv);
85e634bce01af5 Simona Vetter           2016-11-14  275 =20
d1b6c62f892109 Sean Paul               2017-07-20  276  	/**
d1b6c62f892109 Sean Paul               2017-07-20  277  	 * @debugfs_init:
d1b6c62f892109 Sean Paul               2017-07-20  278  	 *
d1b6c62f892109 Sean Paul               2017-07-20  279  	 * Allows drivers =
to create driver-specific debugfs files.
d1b6c62f892109 Sean Paul               2017-07-20  280  	 */
7ce84471e3c72e Wambui Karuga           2020-03-10  281  	void (*debugfs_ini=
t)(struct drm_minor *minor);
85e634bce01af5 Simona Vetter           2016-11-14  282 =20
85e634bce01af5 Simona Vetter           2016-11-14  283  	/**
218adc17b0d362 Chris Wilson            2016-11-25  284  	 * @gem_create_obj=
ect: constructor for gem objects
218adc17b0d362 Chris Wilson            2016-11-25  285  	 *
4ff22f487f8c26 Thomas Zimmermann       2021-11-30  286  	 * Hook for alloca=
ting the GEM object struct, for use by the CMA
4ff22f487f8c26 Thomas Zimmermann       2021-11-30  287  	 * and SHMEM GEM h=
elpers. Returns a GEM object on success, or an
4ff22f487f8c26 Thomas Zimmermann       2021-11-30  288  	 * ERR_PTR()-encod=
ed error code otherwise.
85e634bce01af5 Simona Vetter           2016-11-14  289  	 */
85e634bce01af5 Simona Vetter           2016-11-14  290  	struct drm_gem_obj=
ect *(*gem_create_object)(struct drm_device *dev,
85e634bce01af5 Simona Vetter           2016-11-14  291  						    size_t si=
ze);
d693def4fd1c23 Thomas Zimmermann       2020-09-23  292 =20
d1b6c62f892109 Sean Paul               2017-07-20  293  	/**
d1b6c62f892109 Sean Paul               2017-07-20  294  	 * @prime_handle_t=
o_fd:
d1b6c62f892109 Sean Paul               2017-07-20  295  	 *
6b85aa68d9d5a2 Thomas Zimmermann       2023-06-20  296  	 * PRIME export fu=
nction. Only used by vmwgfx.
d1b6c62f892109 Sean Paul               2017-07-20  297  	 */
85e634bce01af5 Simona Vetter           2016-11-14  298  	int (*prime_handle=
_to_fd)(struct drm_device *dev, struct drm_file *file_priv,
85e634bce01af5 Simona Vetter           2016-11-14  299  				uint32_t handle=
, uint32_t flags, int *prime_fd);
d1b6c62f892109 Sean Paul               2017-07-20  300  	/**
d1b6c62f892109 Sean Paul               2017-07-20  301  	 * @prime_fd_to_ha=
ndle:
d1b6c62f892109 Sean Paul               2017-07-20  302  	 *
6b85aa68d9d5a2 Thomas Zimmermann       2023-06-20  303  	 * PRIME import fu=
nction. Only used by vmwgfx.
d1b6c62f892109 Sean Paul               2017-07-20  304  	 */
85e634bce01af5 Simona Vetter           2016-11-14  305  	int (*prime_fd_to_=
handle)(struct drm_device *dev, struct drm_file *file_priv,
85e634bce01af5 Simona Vetter           2016-11-14  306  				int prime_fd, u=
int32_t *handle);
d693def4fd1c23 Thomas Zimmermann       2020-09-23  307 =20
d1b6c62f892109 Sean Paul               2017-07-20  308  	/**
d1b6c62f892109 Sean Paul               2017-07-20  309  	 * @gem_prime_impo=
rt:
d1b6c62f892109 Sean Paul               2017-07-20  310  	 *
805dc614d58a8f Simona Vetter           2019-06-20  311  	 * Import hook for=
 GEM drivers.
f001488112c43f Noralf Tr=C3=B8nnes          2018-11-10  312  	 *
f001488112c43f Noralf Tr=C3=B8nnes          2018-11-10  313  	 * This defau=
lts to drm_gem_prime_import() if not set.
d1b6c62f892109 Sean Paul               2017-07-20  314  	 */
85e634bce01af5 Simona Vetter           2016-11-14  315  	struct drm_gem_obj=
ect * (*gem_prime_import)(struct drm_device *dev,
85e634bce01af5 Simona Vetter           2016-11-14  316  				struct dma_buf =
*dma_buf);
805dc614d58a8f Simona Vetter           2019-06-20  317  	/**
805dc614d58a8f Simona Vetter           2019-06-20  318  	 * @gem_prime_impo=
rt_sg_table:
805dc614d58a8f Simona Vetter           2019-06-20  319  	 *
805dc614d58a8f Simona Vetter           2019-06-20  320  	 * Optional hook u=
sed by the PRIME helper functions
805dc614d58a8f Simona Vetter           2019-06-20  321  	 * drm_gem_prime_i=
mport() respectively drm_gem_prime_import_dev().
805dc614d58a8f Simona Vetter           2019-06-20  322  	 */
85e634bce01af5 Simona Vetter           2016-11-14  323  	struct drm_gem_obj=
ect *(*gem_prime_import_sg_table)(
85e634bce01af5 Simona Vetter           2016-11-14  324  				struct drm_devi=
ce *dev,
85e634bce01af5 Simona Vetter           2016-11-14  325  				struct dma_buf_=
attachment *attach,
85e634bce01af5 Simona Vetter           2016-11-14  326  				struct sg_table=
 *sgt);
85e634bce01af5 Simona Vetter           2016-11-14  327 =20
4f93624ee7c05d Simona Vetter           2016-11-14  328  	/**
4f93624ee7c05d Simona Vetter           2016-11-14  329  	 * @dumb_create:
4f93624ee7c05d Simona Vetter           2016-11-14  330  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  331  	 * This creates a =
new dumb buffer in the driver's backing storage manager (GEM,
4f93624ee7c05d Simona Vetter           2016-11-14  332  	 * TTM or somethin=
g else entirely) and returns the resulting buffer handle. This
4f93624ee7c05d Simona Vetter           2016-11-14  333  	 * handle can then=
 be wrapped up into a framebuffer modeset object.
4f93624ee7c05d Simona Vetter           2016-11-14  334  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  335  	 * Note that users=
pace is not allowed to use such objects for render
4f93624ee7c05d Simona Vetter           2016-11-14  336  	 * acceleration - =
drivers must create their own private ioctls for such a use
4f93624ee7c05d Simona Vetter           2016-11-14  337  	 * case.
4f93624ee7c05d Simona Vetter           2016-11-14  338  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  339  	 * Width, height a=
nd depth are specified in the &drm_mode_create_dumb
4f93624ee7c05d Simona Vetter           2016-11-14  340  	 * argument. The c=
allback needs to fill the handle, pitch and size for
4f93624ee7c05d Simona Vetter           2016-11-14  341  	 * the created buf=
fer.
4f93624ee7c05d Simona Vetter           2016-11-14  342  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  343  	 * Called by the u=
ser via ioctl.
4f93624ee7c05d Simona Vetter           2016-11-14  344  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  345  	 * Returns:
4f93624ee7c05d Simona Vetter           2016-11-14  346  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  347  	 * Zero on success=
, negative errno on failure.
4f93624ee7c05d Simona Vetter           2016-11-14  348  	 */
85e634bce01af5 Simona Vetter           2016-11-14  349  	int (*dumb_create)=
(struct drm_file *file_priv,
85e634bce01af5 Simona Vetter           2016-11-14  350  			   struct drm_de=
vice *dev,
85e634bce01af5 Simona Vetter           2016-11-14  351  			   struct drm_mo=
de_create_dumb *args);
4f93624ee7c05d Simona Vetter           2016-11-14  352  	/**
4f93624ee7c05d Simona Vetter           2016-11-14  353  	 * @dumb_map_offse=
t:
4f93624ee7c05d Simona Vetter           2016-11-14  354  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  355  	 * Allocate an off=
set in the drm device node's address space to be able to
39dea70d8a479a Simona Vetter           2018-11-27  356  	 * memory map a du=
mb buffer.
39dea70d8a479a Simona Vetter           2018-11-27  357  	 *
39dea70d8a479a Simona Vetter           2018-11-27  358  	 * The default imp=
lementation is drm_gem_create_mmap_offset(). GEM based
39dea70d8a479a Simona Vetter           2018-11-27  359  	 * drivers must no=
t overwrite this.
4f93624ee7c05d Simona Vetter           2016-11-14  360  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  361  	 * Called by the u=
ser via ioctl.
4f93624ee7c05d Simona Vetter           2016-11-14  362  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  363  	 * Returns:
4f93624ee7c05d Simona Vetter           2016-11-14  364  	 *
4f93624ee7c05d Simona Vetter           2016-11-14  365  	 * Zero on success=
, negative errno on failure.
4f93624ee7c05d Simona Vetter           2016-11-14  366  	 */
85e634bce01af5 Simona Vetter           2016-11-14  367  	int (*dumb_map_off=
set)(struct drm_file *file_priv,
85e634bce01af5 Simona Vetter           2016-11-14  368  			       struct dr=
m_device *dev, uint32_t handle,
85e634bce01af5 Simona Vetter           2016-11-14  369  			       uint64_t =
*offset);
85e634bce01af5 Simona Vetter           2016-11-14  370 =20
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  371  	/**
7f5535fcbba2ce Thomas Zimmermann       2024-09-24 @372  	 * @fbdev_probe
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  373  	 *
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  374  	 * Allocates and i=
nitialize the fb_info structure for fbdev emulation.
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  375  	 * Furthermore it =
also needs to allocate the DRM framebuffer used to
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  376  	 * back the fbdev.
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  377  	 *
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  378  	 * This callback i=
s mandatory for fbdev support.
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  379  	 *
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  380  	 * Returns:
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  381  	 *
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  382  	 * 0 on success ot=
 a negative error code otherwise.
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  383  	 */
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  384  	int (*fbdev_probe)=
(struct drm_fb_helper *fbdev_helper,
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  385  			   struct drm_fb=
_helper_surface_size *sizes);
7f5535fcbba2ce Thomas Zimmermann       2024-09-24  386 =20
3f09a0cd4ea3b9 Rob Clark               2023-05-24  387  	/**
3f09a0cd4ea3b9 Rob Clark               2023-05-24  388  	 * @show_fdinfo:
3f09a0cd4ea3b9 Rob Clark               2023-05-24  389  	 *
3f09a0cd4ea3b9 Rob Clark               2023-05-24  390  	 * Print device sp=
ecific fdinfo.  See Documentation/gpu/drm-usage-stats.rst.
3f09a0cd4ea3b9 Rob Clark               2023-05-24  391  	 */
3f09a0cd4ea3b9 Rob Clark               2023-05-24  392  	void (*show_fdinfo=
)(struct drm_printer *p, struct drm_file *f);
3f09a0cd4ea3b9 Rob Clark               2023-05-24  393 =20
d1b6c62f892109 Sean Paul               2017-07-20  394  	/** @major: driver=
 major number */
85e634bce01af5 Simona Vetter           2016-11-14  395  	int major;
d1b6c62f892109 Sean Paul               2017-07-20  396  	/** @minor: driver=
 minor number */
85e634bce01af5 Simona Vetter           2016-11-14  397  	int minor;
d1b6c62f892109 Sean Paul               2017-07-20  398  	/** @patchlevel: d=
river patch level */
85e634bce01af5 Simona Vetter           2016-11-14  399  	int patchlevel;
d1b6c62f892109 Sean Paul               2017-07-20  400  	/** @name: driver =
name */
85e634bce01af5 Simona Vetter           2016-11-14  401  	char *name;
d1b6c62f892109 Sean Paul               2017-07-20  402  	/** @desc: driver =
description */
85e634bce01af5 Simona Vetter           2016-11-14  403  	char *desc;
7fb8af6798e8d0 Jani Nikula             2024-04-29  404  	/** @date: driver =
date, unused, to be removed */
85e634bce01af5 Simona Vetter           2016-11-14  405  	char *date;
85e634bce01af5 Simona Vetter           2016-11-14  406 =20
0e2a933b02c972 Simona Vetter           2019-01-29  407  	/**
0e2a933b02c972 Simona Vetter           2019-01-29  408  	 * @driver_feature=
s:
0e2a933b02c972 Simona Vetter           2019-01-29  409  	 * Driver features=
, see &enum drm_driver_feature. Drivers can disable
0e2a933b02c972 Simona Vetter           2019-01-29  410  	 * some features o=
n a per-instance basis using
0e2a933b02c972 Simona Vetter           2019-01-29  411  	 * &drm_device.dri=
ver_features.
0e2a933b02c972 Simona Vetter           2019-01-29  412  	 */
85e634bce01af5 Simona Vetter           2016-11-14  413  	u32 driver_feature=
s;
bb2eaba6458ace Simona Vetter           2017-05-31  414 =20
bb2eaba6458ace Simona Vetter           2017-05-31  415  	/**
bb2eaba6458ace Simona Vetter           2017-05-31  416  	 * @ioctls:
bb2eaba6458ace Simona Vetter           2017-05-31  417  	 *
bb2eaba6458ace Simona Vetter           2017-05-31  418  	 * Array of driver=
-private IOCTL description entries. See the chapter on
bb2eaba6458ace Simona Vetter           2017-05-31  419  	 * :ref:`IOCTL sup=
port in the userland interfaces
bb2eaba6458ace Simona Vetter           2017-05-31  420  	 * chapter<drm_dri=
ver_ioctl>` for the full details.
bb2eaba6458ace Simona Vetter           2017-05-31  421  	 */
bb2eaba6458ace Simona Vetter           2017-05-31  422 =20
85e634bce01af5 Simona Vetter           2016-11-14  423  	const struct drm_i=
octl_desc *ioctls;
bb2eaba6458ace Simona Vetter           2017-05-31  424  	/** @num_ioctls: N=
umber of entries in @ioctls. */
85e634bce01af5 Simona Vetter           2016-11-14  425  	int num_ioctls;
bb2eaba6458ace Simona Vetter           2017-05-31  426 =20
bb2eaba6458ace Simona Vetter           2017-05-31  427  	/**
bb2eaba6458ace Simona Vetter           2017-05-31  428  	 * @fops:
bb2eaba6458ace Simona Vetter           2017-05-31  429  	 *
bb2eaba6458ace Simona Vetter           2017-05-31  430  	 * File operations=
 for the DRM device node. See the discussion in
bb2eaba6458ace Simona Vetter           2017-05-31  431  	 * :ref:`file oper=
ations<drm_driver_fops>` for in-depth coverage and
bb2eaba6458ace Simona Vetter           2017-05-31  432  	 * some examples.
bb2eaba6458ace Simona Vetter           2017-05-31  433  	 */
85e634bce01af5 Simona Vetter           2016-11-14  434  	const struct file_=
operations *fops;
85e634bce01af5 Simona Vetter           2016-11-14 @435  };
85e634bce01af5 Simona Vetter           2016-11-14  436 =20

:::::: The code at line 372 was first introduced by commit
:::::: 7f5535fcbba2ce7f1908ee7e5c350032a4b1e9d0 drm/fbdev: Add memory-agnos=
tic fbdev client

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
