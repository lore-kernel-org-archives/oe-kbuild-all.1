Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A40199938
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736150498; cv=none; b=VYP2P1QQkMD1jfvgKwnEKvw4WnE4/KcvQkg6Avkd3ddxJqo64pbKScqrXLbobTE+w/tFF2kUUvZTqxumOA8NG+2EhlMzKj9bejZ0e0hdHuB6zbH1C/CdslbioQAeVxxm9zLPBxAmg0Z8dhl8GiMSmW/0tVPfKOmlmTqqIRs1Kog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736150498; c=relaxed/simple;
	bh=v/5G+PFWEZbU8pDIm5FxvSrH5OEu2vahwkXFvzXmIzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPRdz5a8kbs/6wPo1v6dKpaOHLodO/VXxjbbUi/OPcUf7t8YODeHXwGh1pJAelyZs5fpt1IG4yRr3K45T5RzkiY36HQ+b0zYO2y6VbD3H1CxC/qvnjfomZn8strqzUCEZxOgsSWLYbg3itGVDw97gvs//Q7QqxBFLGmwRIwcOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KG91WgCx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KG91WgCx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e06af753so7026292f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 00:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736150493; x=1736755293; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NA4fve8hGhqXSVITorcQfMkQAMnFkhT3ze3kgb2upiQ=;
        b=KG91WgCxQ3T2+FioGyy+zFBLI8Gn2gUdaJ28ib3CHWZYmhSxv7r/i2ygH0W+mRw0Rk
         LLZ7iCqASi36b2CRqtBHOqj5C2f8GU2QiHaD2Qnub34DfL22Isf7x/01I6F2Rn+Rr8Jr
         I6sLg4EoCzEWqilTYSM4LtwaCG+EaowFEhxyS46bgRpe6Y5a168lZ1ypnlZthsIAkewn
         YgS9wPovGdSORm7aa1RXPpP+gq7d1xi+ZOS6v50nDF5cPwXVd6E8VFnoIZGjagUu32C6
         QWeDEMnT73Q1QtL5A9poYvQoERujmwxzvMCos2kdtJpw81uAQaLyTEw4VZBqLbobL+1Z
         lhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736150493; x=1736755293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NA4fve8hGhqXSVITorcQfMkQAMnFkhT3ze3kgb2upiQ=;
        b=FpZOGdKO/ouLxRJxB4I5Wi1wSD/Vye7HIOek4tN6z+V59dQEzGOinWhtPELmlEHb6a
         Sf2I59zAQ0YiYEI/tQt3JIaCP5FP8eY7y+Do0fYOaMWb2NpexwwURxuTRj9WyJHo+/HI
         zZdclv3HILMH/6MhR/fAJvTHba5c/BrN5VVstv8xulrZEVcJwCL0bQ4JT/xB+0iIIgyZ
         Ac0J51kPgYIf7IyAUg17QZf+VS7rewpCXwVi+9aqvLiiIcdyRXW0VImh8U7cF5uGMu3E
         UbCXZiTJkUB6X9CmNGwPdWtHiGoy9iG0ckhR3TlhDGbM2k2rcpn114z+dOa/Okevcm/Y
         7ylQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmDcQ/lvEf9yMXKNbsMxv3ulbOlzV9PO0o3h2ltsW6ujgWMAZZNmURNuP5MIaiAZyJhurqDn1Ea9pbom0p@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3vrfx4riY3jiqRKBgCwE2mwJ0Lljlozt16afsFofRg5ixEcj6
	P0PXWlrL2vIP+Q9TYHaciC/ZFZnaaXjF3aawTpKNll1eUCOujJ21wNI7pYSx+Ks=
X-Gm-Gg: ASbGncvlIe1eu/zwo8/xzx9esOL2ZQw5yehEwjOdKNxTppNtYQRQCC1/Bs9xTEjioGD
	v3HalvboTjmBci064n/jeonzZtO/n0wdX0YVof6PQmtKWVhL7TCzdDRHazts9dU5XyEt49s6g7a
	z0cgyef1brtFACNTq7iRxj/Zv8EgfMtHEY51JM3aXE98cYJtalMf6UwKtsKosMQB3TxOTFZR7y1
	F4p/of9rMFSfKL0BpdVGDtlkpb8sJQXe1kpDoNXoSvpjxns+m95XSaee3DCyw==
X-Google-Smtp-Source: AGHT+IHLwJ8zk7mruC75rk0jPcosc1BH3yQdl73ZRyrEh7sIcStX9d22zAj8/rPTATVQ7OjADv+obw==
X-Received: by 2002:a05:6000:4007:b0:382:4926:98fa with SMTP id ffacd0b85a97d-38a223f5c46mr52412943f8f.40.1736150491587;
        Mon, 06 Jan 2025 00:01:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364b0532a6sm573987775e9.1.2025.01.06.00.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:01:31 -0800 (PST)
Date: Mon, 6 Jan 2025 11:01:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Homura Akemi <a1134123566@gmail.com>
Subject: Re: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
Message-ID: <4279c951-592d-422b-b8b1-0596752b4030@stanley.mountain>
References: <6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen@synopsys.com>
 <d9f6af01-7a20-45aa-b6f1-380711aaec92@stanley.mountain>
 <20241220023105.ruvvhqbzd3m37ce4@synopsys.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220023105.ruvvhqbzd3m37ce4@synopsys.com>

Sorry for the delayed response.  I was on vacation.

On Fri, Dec 20, 2024 at 02:31:20AM +0000, Thinh Nguyen wrote:
> On Thu, Dec 19, 2024, Dan Carpenter wrote:
> > Hi Thinh,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Thinh-Nguyen/usb-gadget-f_tcm-Don-t-free-command-immediately/20241211-092317 
> > base:   d8d936c51388442f769a81e512b505dcf87c6a51
> > patch link:    https://lore.kernel.org/r/6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen%40synopsys.com 
> > patch subject: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
> > config: nios2-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241219/202412192132.XB16SilM-lkp@intel.com/config )
> > compiler: nios2-linux-gcc (GCC) 14.2.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202412192132.XB16SilM-lkp@intel.com/ 
> > 
> > smatch warnings:
> > drivers/usb/gadget/function/f_tcm.c:1308 usbg_cmd_work() error: we previously assumed 'active_cmd' could be null (see line 1265)
> > 
> > vim +/active_cmd +1308 drivers/usb/gadget/function/f_tcm.c
> > 
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1227  static void usbg_cmd_work(struct work_struct *work)
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1228  {
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1229  	struct usbg_cmd *cmd = container_of(work, struct usbg_cmd, work);
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1230  
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1231  	/*
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1232  	 * Failure is detected by f_tcm here. Skip submitting the command to the
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1233  	 * target core if we already know the failing response and send the usb
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1234  	 * response to the host directly.
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1235  	 */
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1236  	if (cmd->tmr_rsp != RC_RESPONSE_UNKNOWN)
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1237  		goto skip;
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1238  
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1239  	if (cmd->tmr_func)
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1240  		usbg_submit_tmr(cmd);
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1241  	else
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1242  		usbg_submit_cmd(cmd);
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1243  
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1244  	return;
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1245  
> > 287b3d115e5351 Thinh Nguyen          2024-12-11  1246  skip:
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1247  	if (cmd->tmr_rsp == RC_OVERLAPPED_TAG) {
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1248  		struct f_uas *fu = cmd->fu;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1249  		struct se_session *se_sess;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1250  		struct uas_stream *stream = NULL;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1251  		struct hlist_node *tmp;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1252  		struct usbg_cmd *active_cmd = NULL;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1253  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1254  		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1255  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1256  		hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag) {
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1257  			int i = stream - &fu->stream[0];
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1258  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1259  			active_cmd = &((struct usbg_cmd *)se_sess->sess_cmd_map)[i];
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1260  			if (active_cmd->tag == cmd->tag)
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1261  				break;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1262  		}
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1263  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1264  		/* Sanity check */
> > 7735c10c74d903 Thinh Nguyen          2024-12-11 @1265  		if (!stream || (active_cmd && active_cmd->tag != cmd->tag)) {
> > 
> > Testing for !stream is sufficient.  Another option would be to write this
> 
> Just testing for !stream is sufficient to know whether active_cmd is
> NULL, but we still need to check for matching tag also.

Yes.  Sorry, I was unclear.  That's what I meant.  We could write it
as:

	if (!stream || active_cmd->tag != cmd->tag) {

There is no need to check if active_cmd is non-NULL since we know that
stream is non-NULL.  However, if we DO check it, then we should check
it consistently everywhere.

> 
> > as:
> > 	if (!stream || !active_cmd || active_cmd->tag != cmd->tag)) {
> 
> Perhaps we can just do this:
> 
> 	if (!active_cmd || active_cmd->tag != cmd->tag)) {
> 
> If active_cmd is NULL, then the stream variable must also be NULL. This
> may not be obvious.
> 
> > 
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1266  			usbg_submit_command(cmd->fu, cmd->req);
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1267  			return;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1268  		}
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1269  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1270  		reinit_completion(&stream->cmd_completion);
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1271  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1272  		/*
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1273  		 * A UASP command consists of the command, data, and status
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1274  		 * stages, each operating sequentially from different endpoints.
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1275  		 *
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1276  		 * Each USB endpoint operates independently, and depending on
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1277  		 * hardware implementation, a completion callback for a transfer
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1278  		 * from one endpoint may not reflect the order of completion on
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1279  		 * the wire. This is particularly true for devices with
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1280  		 * endpoints that have independent interrupts and event buffers.
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1281  		 *
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1282  		 * The driver must still detect misbehaving hosts and respond
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1283  		 * with an overlap status. To reduce false overlap failures,
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1284  		 * allow the active and matching stream ID a brief 1ms to
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1285  		 * complete before responding with an overlap command failure.
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1286  		 * Overlap failure should be rare.
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1287  		 */
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1288  		wait_for_completion_timeout(&stream->cmd_completion, msecs_to_jiffies(1));
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1289  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1290  		/* If the previous stream is completed, retry the command. */
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1291  		if (!hash_hashed(&stream->node)) {
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1292  			usbg_submit_command(cmd->fu, cmd->req);
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1293  			return;
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1294  		}
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1295  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1296  		/*
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1297  		 * The command isn't submitted to the target core, so we're safe
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1298  		 * to remove the bitmap index from the session tag pool.
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1299  		 */
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1300  		sbitmap_queue_clear(&se_sess->sess_tag_pool,
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1301  				    cmd->se_cmd.map_tag,
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1302  				    cmd->se_cmd.map_cpu);
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1303  
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1304  		/*
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1305  		 * Overlap command tag detected. Cancel any pending transfer of
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1306  		 * the command submitted to target core.
> > 7735c10c74d903 Thinh Nguyen          2024-12-11  1307  		 */
> > 7735c10c74d903 Thinh Nguyen          2024-12-11 @1308  		active_cmd->tmr_rsp = RC_OVERLAPPED_TAG;
> > 
> > The inconsistent NULL check triggers a warning here.
> > 
> 
> We already check for !stream prior, so I didn't check for active_cmd
> here. This is more of a consistency issue. If possible and if needed, we
> can make this more consistent after the merge?

This is not a run time bug, yes.  It's just an inconsistent NULL check,
but the NULL check is not necessary so that's not a problem.  I don't
have a vote on how you merge it.  ;)  You can do that however you want.

regards,
dan carpenter

