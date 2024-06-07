Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0852D45024
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717742955; cv=none; b=SK3vBnQSzuUwiijVJQpVGpi/CcspyKBXTZJ0IzVrnNZqTPdaZNi1U6mhWR0jmbSWI/eSEwJ0CMoYIuWXS+Utcf4N99ascTiTYPX679LLTtiGskGjeroeXj8DQceRUP2IOjeKx6zoMMbG/6RbF3NMJNqO7z1DxO44G0GrcI51EA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717742955; c=relaxed/simple;
	bh=sk3zL7tFOk2jwFtYX7g9U73orqYDS6vSS3zxEaOXEuE=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=J1thFCuE3iP/eqKjjlVwxKL2/0XL00aDGIoaY/BNPx1HbgVuVGFVeWlX1qxMLvGXdvsCfQqfZ5Ug2rBf15K4Y0Mv0pRrQ0H7Dh/AN6u78WHgLqb3rfY3gjs/UehMYdbF0vlDzX70MVmhQSIlHHthrQUVvamuptbk88gPex4hd4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Mj3ZgNcM; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Mj3ZgNcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QbnUSq2pPDxntPBJMcNmUi5vpI1jQpvLj4Masm7uAUE=;
  b=Mj3ZgNcMqVajAut9iWPBFX3dpbjVVA2fePX3DZa0q/Jtck+irT8rd5hr
   l/XSbbWuxSL0EFo6DQMpiF7D+rb3+GuO5eFm5qToe+OCjmJI5B8f375wd
   BZ28JRbOlNjWEIgLSlxFIEfvgjNaFQVaa3U+sYLxPt0PMkUmzv0y12cLs
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,220,1712613600"; 
   d="scan'208";a="169461460"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 08:48:00 +0200
Date: Fri, 7 Jun 2024 08:47:59 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Guenter Roeck <groeck@google.com>
cc: cros-kernel-buildreports@googlegroups.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 111/126] drivers/mailbox/mtk-cmdq-sec-tee.c:172:2-8:
 preceding lock on line 158 (fwd)
Message-ID: <cb5c2b6d-5f1d-15d6-ae58-d13a482b9b36@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

Please check whether an unlock is needed on line 172.

There is another error noted on line 219, but that code is not included.

julia

---------- Forwarded message ----------
Date: Fri, 7 Jun 2024 14:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 111/126]
    drivers/mailbox/mtk-cmdq-sec-tee.c:172:2-8: preceding lock on line 158

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   bb84077a7f2f0e6433f0c71d35738db6fcfca976
commit: a0f3bf1449bdfbea99babee760c8886ee574e42a [111/126] BACKPORT: FROMLIST: mailbox: mediatek: Add CMDQ secure mailbox driver
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-r062-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071437.bg3BwASr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406071437.bg3BwASr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mailbox/mtk-cmdq-sec-tee.c:172:2-8: preceding lock on line 158
--
>> drivers/mailbox/mtk-cmdq-sec-mailbox.c:219:58-62: ERROR: invalid reference to the index variable of the iterator on line 201

vim +172 drivers/mailbox/mtk-cmdq-sec-tee.c

a0f3bf1449bdfb Jason-jh Lin 2024-05-27  149
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  150  int cmdq_sec_execute_session(struct cmdq_sec_tee_context *tee, u32 cmd, s32 timeout_ms)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  151  {
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  152  #if IS_ENABLED(CONFIG_TEE)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  153  	struct tee_ioctl_invoke_arg invoke_arg = {0};
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  154  	struct tee_param params = {0};
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  155  	u64 ts = sched_clock();
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  156  	int ret = 0;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  157
a0f3bf1449bdfb Jason-jh Lin 2024-05-27 @158  	mutex_lock(&cmdq_sec_exec_lock);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  159
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  160  	params.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  161  	params.u.memref.shm = tee->shared_mem;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  162  	params.u.memref.shm_offs = 0;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  163  	params.u.memref.size = tee->shared_mem->size;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  164
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  165  	invoke_arg.num_params = 1;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  166  	invoke_arg.session = tee->session;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  167  	invoke_arg.func = cmd;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  168
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  169  	ret = tee_client_invoke_func(tee->tee_context, &invoke_arg, &params);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  170  	if (ret) {
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  171  		pr_err("tee_client_invoke_func failed, ret=%d\n", ret);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27 @172  		return -EFAULT;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  173  	}
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  174
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  175  	ret = invoke_arg.ret;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  176
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  177  	mutex_unlock(&cmdq_sec_exec_lock);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  178
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  179  	ts = div_u64(sched_clock() - ts, 1000000);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  180
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  181  	if (ret != 0)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  182  		pr_err("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  183  	else if (ts > timeout_ms)
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  184  		pr_err("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  185  	else
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  186  		pr_debug("[SEC]execute: TEEC_InvokeCommand:%u ret:%d cost:%lluus", cmd, ret, ts);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  187
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  188  	return ret;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  189  #else
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  190  	return -EFAULT;
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  191  #endif
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  192  }
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  193  EXPORT_SYMBOL_GPL(cmdq_sec_execute_session);
a0f3bf1449bdfb Jason-jh Lin 2024-05-27  194

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
