Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DD63438BE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299424; cv=none; b=b5eWfCWvDi5uXgK8CPCu4A+FH32DWjJpzKVsVNKv6UVGJ4FpppuTvu0GVHILn2vgmRnElwgaVgR+40WYEVNu85PISuh4IaAwbv/2WfLMuCEa7FAoWmeRsfBFbKuCanLI5XhF1QUVf9QQ6txe2wb3luuLOn0V5OeWkts5bY7ezuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299424; c=relaxed/simple;
	bh=5o8FcnKuKgIeMCrWZnC45uFxgbgI8eY4l7CR0YdMx8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPm4J3giT8i8ICtZeCllSl8mfC25ME7MSJpZOXeoZWQ0Q5+3K6S4Ji5Avx73L+hQ5Nld/7Axunw/5IAnRhSS6uDQFPC6XzsZxYl8PmP3f4nUH8oumnkpHDTZdFuwIdIpP4wSTB8dTiGimYmoRXeLHdbhz0maTtLSYz+1wtGqUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYNN8Vl6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYNN8Vl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658F61F00893;
	Mon,  1 Jun 2026 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780299423;
	bh=3D4v0MuLRFWF+5bo/ZHsBFLiVbzLJjU5dRzRmgh06EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SYNN8Vl6qqH7Dj2EbCfFGN0tzYhHAQavLP3Q7VANowaiHJkuGVrkoAed+exzpWqdP
	 tQrPGgcwhYFSsoDSWJos+rmOFHbuG6/p2Vlg4ozFD6mTL1Gp+OIklhkHyQc+aHY7Eu
	 e5Bacru/ZFJvnlpij0UINZpyoJbLpYvH/kj0bpzc2gJxVoVszJIX52yikp3g6Kzzfa
	 zAYWL42hOE/3Q87S75ONOypUFkuPYEOp7C+X/AWr4vWIf0+7wWNdArFDY5zt2QZoPd
	 LNTMMMFFp7B7iVO3cMNQ4sw058XvKa/2kHVtPmzTmJdLTZFLEzLNs21Jthc+rAsqP0
	 xG0g3aK0GPe9w==
Date: Mon, 1 Jun 2026 09:36:59 +0200
From: Niklas Cassel <cassel@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Bart Van Assche <bvanassche@acm.org>, oe-kbuild-all@lists.linux.dev,
	Hannes Reinecke <hare@kernel.org>
Subject: Re: [libata:for-next 12/13] Warning: drivers/ata/libata-scsi.c:1850
 function parameter 'ap' not described in 'ata_scsi_translate'
Message-ID: <ah02myPU1BcL_RQF@ryzen>
References: <202606011207.M7VA2A90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606011207.M7VA2A90-lkp@intel.com>

On Mon, Jun 01, 2026 at 12:40:25PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for-next
> head:   28cee4cb852c2c8c27925c65bc612be2acb7d7ca
> commit: ebfb3924ee1c09d8794892aaee308a8a52f284d9 [12/13] ata: libata: Pass ap parameter directly to functions in the issuing path
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260601/202606011207.M7VA2A90-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011207.M7VA2A90-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606011207.M7VA2A90-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: drivers/ata/libata-scsi.c:1850 function parameter 'ap' not described in 'ata_scsi_translate'
> >> Warning: drivers/ata/libata-scsi.c:1850 function parameter 'ap' not described in 'ata_scsi_translate'
> --
> >> Warning: drivers/ata/libata-core.c:5163 function parameter 'ap' not described in 'ata_qc_issue'
> >> Warning: drivers/ata/libata-core.c:5163 function parameter 'ap' not described in 'ata_qc_issue'
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Seems like I missed to git add the kdoc changes.

Will fix up the commit like this:

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index c504f8082c77..94497088867b 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -5150,6 +5150,7 @@ EXPORT_SYMBOL_GPL(ata_qc_get_active);
 
 /**
  *     ata_qc_issue - issue taskfile to device
+ *     @ap: ATA port of interest
  *     @qc: command to issue to device
  *
  *     Prepare an ATA command to submission to device.
diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index 8fcf81a94ef3..0fe7ffded6e2 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -1826,6 +1826,7 @@ static int ata_scsi_qc_issue(struct ata_port *ap, struct ata_queued_cmd *qc)
  *     @dev: ATA device to which the command is addressed
  *     @cmd: SCSI command to execute
  *     @xlat_func: Actor which translates @cmd to an ATA taskfile
+ *     @ap: ATA port of interest
  *
  *     Our ->queuecommand() function has decided that the SCSI
  *     command issued can be directly translated into an ATA



Kind regards,
Niklas
