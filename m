Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A071E1E12
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520477; cv=none; b=D3qudwqVI8BeE9ZTDZl62HMPgkSpd8ly4jfWhiz4Ru3nAEpaLHkepmAATsMuQMjhk6gATl8+J2Y9yzJ2XIhS5F/8+zomhXWVya/lqZeL8jvpzP9vpAdaNEBrlt3EbYzCbQOrvVXdrcN4BX+PEIjRObOK67Al4Q+NvpJmDlBLwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520477; c=relaxed/simple;
	bh=L1QDbNza9LlNKwY/uEDkIeJ0pfZJLYrah9jQ7ErtRVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cZJBszKQR23AWVUQe32vXjft2P/WPX0GyYMnmESNmjCENda+VvlN865l70ps54yr81qlQSv8+0s9Bh9A6jQbjBxO5Wz+GexWMIy8agns6scMMPULoNt4ugFCP8vbsduGIOuDTiVcjj3mzi0R8q/8E4S1n+Sh3Zb+bK50aykdMOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AXXg/CFs; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AXXg/CFs"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 3D9DF1D0028F;
	Tue,  3 Mar 2026 01:47:53 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 03 Mar 2026 01:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772520473; x=1772606873; bh=mRH/PWo0ni49zRq5vJ+tSuO3ez7RUwLeHV5
	wwaIGxBQ=; b=AXXg/CFseOA+QHxm0YznyljfnGwkZ8cxJVAsw7zMeVW11jTDhm7
	OKN4x+dDzo31n435ccwiD9pTQGULQQW3cBYO/O0df4fhj0oVSpRo8wsa+xBxE9i7
	8AObCXKtFEaiH1MR6nixnh552+n/oUcKS2RhWmPjwJCPgAJU4a9OSC66bJzhXGU8
	Xd33sBtvtIgyqqqoQpAexyjiuna+WiVu4dTkUbORo2m3Z/lzzglTIJkE4cgTyboG
	+53fP+DH/qgDKdYmeDETsg0z6NuvUI3rNmiVTP+Gp4TBs4tC03f6huszR8sGpDk5
	eToTx19H1KcxID6eaz8HgeGOA5Er0eoS/ZA==
X-ME-Sender: <xms:GISmaZKGxdk-a-WwsddyV5K3JBrjICStdOXstr4LfiFjU0uHjx36MA>
    <xme:GISmaY9MTiItAsES7SKk3EF-mTPWwgsEBmwHJbTf2hg5TLQ4HKug6lRs0Xjp2y7fc
    xdBKmvZZ6OL-nT3d0--z2I1rx92pudVrx1voJBWCqdC28ffHAmM0lc>
X-ME-Received: <xmr:GISmaaxyQNzP40jBWDmq5GfzX_wubwG6xK31ZJ4SYaXWbjcL6Liaf398IWLiknvfOgfsegdl3cY2HUbsonsKNPucL5J-touMAR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpefhhfdtheejlefgieffhffhfeffgfejfeeluedufeeuhfevtdeiheehudfhgeeh
    ueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhu
    gidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehnjhgrvhgrlhhisehmrghrvhgvlhhlrdgtohhmpdhrtghpthhtohep
    rghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouh
    hnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrd
    horhhgpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhu
    gidruggvvhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:GISmad624QAVewqa1BIV_V1m4c4-t8NbnNXHHeI9jv-gllIFEcwO2w>
    <xmx:GISmaZ9Ld9GSHujIWtJdck8oY1aFcmbqpeqSeMr5IYRw2TZ4nmCyAg>
    <xmx:GISmaarK3Inh1YnmcSOPxAqcefVif_I42bhGfYlp5BAQdPQHt62P_Q>
    <xmx:GISmaSokuMZAWcqddbzXQmW7EMQ3d6fKzB_mF7iGn_LrqG79FlaFbQ>
    <xmx:GYSmaVZp4C4-Q6EE2Ddc3NsZ2zaaT36N7P3ooCTYSIq3bAfeuXjWuFoI>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 01:47:49 -0500 (EST)
Date: Tue, 3 Mar 2026 17:48:48 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Nilesh Javali <njavali@marvell.com>
cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: Re: include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_431' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
In-Reply-To: <202603030747.VX0v4otS-lkp@intel.com>
Message-ID: <6bc11e2f-393d-16a2-9664-a20e2f1d3767@linux-m68k.org>
References: <202603030747.VX0v4otS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 3 Mar 2026, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
> commit: e428b013d9dff30f7a65509e33047ba975cce8ba atomic: specify alignment for atomic_t and atomic64_t
> date:   5 weeks ago
> config: m68k-randconfig-r133-20260303 (https://download.01.org/0day-ci/archive/20260303/202603030747.VX0v4otS-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603030747.VX0v4otS-lkp@intel.com/reproduce)

This config is an unlikely one (fibre channel storage with a coldfire 
processor) which is probably why 'make randconfig' was needed in order to 
expose the problem. It's essentially a theoretical bug but I will try to 
patch it anyway.

What's happening here is that the patch that naturally aligned atomic_t 
caused some new padding to appear at the end of this struct:


--- a/pahole.out
+++ b/pahole.out
@@ -1,16 +1,18 @@
 struct qla_tgt_sess_op {
         struct scsi_qla_host *     vha;                  /*     0     4 */
         uint32_t                   chip_reset;           /*     4     4 */
-        struct work_struct         work;                 /*     8    16 */
+        struct work_struct         work __attribute__((__aligned__(4))); /*     8    16 */
         struct list_head           cmd_list;             /*    24     8 */
         bool                       aborted;              /*    32     1 */
 
         /* XXX 1 byte hole, try to pack */
 
         struct rsp_que *           rsp;                  /*    34     4 */
         struct atio_from_isp       atio;                 /*    38    64 */
 
-        /* size: 102, cachelines: 2, members: 7 */
+        /* size: 104, cachelines: 2, members: 7 */
         /* sum members: 101, holes: 1, sum holes: 1 */
-        /* last cacheline: 38 bytes */
-};
+        /* padding: 2 */
+        /* forced alignments: 1 */
+        /* last cacheline: 40 bytes */
+} __attribute__((__aligned__(4)));


The BUILD_BUG_ON assertion checks the size of the struct, which doesn't 
seem right, because any padding at the end of the struct does not 
interfere with the subsequent kzalloc() and memcpy() in 
qlt_queue_unknown_atio().

I suppose the assertion could be motivated by some code elsewhere but I 
haven't yet found it. So perhaps the assertion can simply be removed. An 
alternative solution could be to increase the 1 byte hole to 3 bytes, and 
prevent tail padding that way.

But padding should be irrelevant to the real requirement --

struct qla_tgt_sess_op {
        struct scsi_qla_host *vha;
        uint32_t chip_reset;
        struct work_struct work;
        struct list_head cmd_list;
        bool aborted;
        struct rsp_que *rsp;
                            
        struct atio_from_isp atio;
        /* DO NOT ADD ANYTHING ELSE HERE - atio must be last member */
};

And yet, there's already a precedent in this driver for padding a struct 
in order to satisfy a BUILD_BUG_ON --

struct atio7_fcp_cmnd { 
        uint64_t lun;   
        uint8_t  cmnd_ref;
        uint8_t  task_attr:3;
        uint8_t  reserved:5;
        uint8_t  task_mgmt_flags;
#define FCP_CMND_TASK_MGMT_CLEAR_ACA            6
#define FCP_CMND_TASK_MGMT_TARGET_RESET         5
#define FCP_CMND_TASK_MGMT_LU_RESET             4
#define FCP_CMND_TASK_MGMT_CLEAR_TASK_SET       2
#define FCP_CMND_TASK_MGMT_ABORT_TASK_SET       1
        uint8_t  wrdata:1;
        uint8_t  rddata:1;
        uint8_t  add_cdb_len:6;
        uint8_t  cdb[16];
        /*
         * add_cdb is optional and can absent from struct atio7_fcp_cmnd. Size 4
         * only to make sizeof(struct atio7_fcp_cmnd) be as expected by
         * BUILD_BUG_ON in qlt_init().
         */ 
        uint8_t  add_cdb[4];
        /* __le32       data_length; */
} __packed;


So I'm undecided. Any thoughts, Nilesh?

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603030747.VX0v4otS-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    In function 'qlt_queue_unknown_atio',
>        inlined from 'qlt_24xx_atio_pkt_all_vps' at drivers/scsi/qla2xxx/qla_target.c:331:4,
>        inlined from 'qlt_24xx_process_atio_queue' at drivers/scsi/qla2xxx/qla_target.c:7903:4:
> >> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_431' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u)
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                          ^
>    include/linux/compiler_types.h:612:4: note: in definition of macro '__compiletime_assert'
>        prefix ## suffix();    \
>        ^~~~~~
>    include/linux/compiler_types.h:631:2: note: in expansion of macro '_compiletime_assert'
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>      ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                         ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>      BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>      ^~~~~~~~~~~~~~~~
>    drivers/scsi/qla2xxx/qla_target.c:216:2: note: in expansion of macro 'BUILD_BUG_ON'
>      BUILD_BUG_ON(offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u));
>      ^~~~~~~~~~~~
> 
