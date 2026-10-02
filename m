Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05C53612E7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917593; cv=none; b=TTKsm5/p4u1UwY2zBtobEMNFrATbJC73ZuodaV7iT1zUQpQuSDhGc79bsoJmzZ9Yhw/nIntK2llCDgfapcR+O8U3qy9zvJ6mCmlegywjPdH/Nyip33lfcGg9j4NDtHwgK4hcxq78oaUgmfzO36muIMuWfknFVej+tcZVOIEhSuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917593; c=relaxed/simple;
	bh=b2PYffbQu0LiIrlwwgXBVJevEQgfnckMqQ11SN4MLWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAsaSFyBTJFCmfeJzAMnFhgSAfBkGLgNjMpjNKL9PmT2ml8p7znSZ6KH6qgFcxGhkoSemDInBoTMJo1EC2qT8nC47MiCSLMd0rR7j/tR5nSDFJ3cOHpuDh942S5j1cXotBezSvU4pQDlwzMM9eWEuyELdDulF7HOV68t7SHqEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6GmSuHn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6GmSuHn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so4189814f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Oct 2026 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790917590; x=1791522390; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTn0Od7NqDwouQEAooTW7xcGRo+VrAdp0mD9BcMogI0=;
        b=I6GmSuHn32VJR31UW6hJ6ym2Nuh6azc0Kap2RrEgjh2Ep8saDt0GpvPDJqMjBHgzt2
         dxilTvETsrEvfCOS+p0bJRVo87PZ8eG7LXb/6VmM780U6S4BWHDMlk5orLbcDZChnVSF
         826BKQoHIbGiN0GohbtlHZe/cvUHSezg0XsSifI9b86Rur43qeoWpPl0cuNeGEGHpojg
         FrtdkpiyyCjah7KsRo1Ty7vj7QKkKNgoGWtwiHcYd2qhDM1t9tQKc8OEZZDRJGLFX7Fx
         3G6PdILqTqf5DWPkI5F9lmcWlvvsioIdA0fmB4BIJR/L8QTINPYOleK1va89Gvj1smyR
         7T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790917590; x=1791522390;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTn0Od7NqDwouQEAooTW7xcGRo+VrAdp0mD9BcMogI0=;
        b=ojghQc7Tp6p632Rl7+L/Ky6uo+DyijvS2xUsmgeqnk9fjn7nXFJ1I+sQHvffhpP9Bz
         E55HNJIbjM1VrSWQ7V+3bfQs/6LxqE7eE9poY/09xx8lY9J0/bjSiQVZo7SFuQMGv0tJ
         7OIFK8v5KFy1UOwRX2XEEoeecVsFYE54dfVl7GZxLpA5NlnqK7AwjjYJWCWUOe/tlNe/
         7KP2KsHPPC8zHD78agBWebEnuxQ/9v/glM2mBuMzEZ6Z1noVNhp7JIAxL8ivyqVTLEJv
         Jlp2fil+gMnaS/UNBctm9Cj+C0XzuwCuSjWRLKTvj9fIrsoFi95+uS3d2zbxyomfS1vH
         0IUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAaS8FFZaBsbGuTJYDGiSK97Nxme2qHT4YGbmNR5YPMXqtulJJXAzVXRToZsM8rxx4jJD3o9SbcpRn/lWM@lists.linux.dev
X-Gm-Message-State: AFq9FYKN/hod3B6Dh1Tgvmr6bXCpPKD47wWfCjlnvlZ2bKO3MQmJ+YNU
	vKyJv+RZDHQhLyBKulTn2k1uv4kSx+jDcmj6KOnz5IENHeZK8hwthBQSYptTNQncpWZ11w==
X-Gm-Gg: AYBFou0krUaxt1mxpjlUD0ctljkZfPYibe0FfXf5kJGD30mxegnLuG4hri0rrg/aej0
	fYjCcP7f7d6sOJP4iLjFQmhmIXofAjk7Rb5UJXDs1HM4+bNfD4ad8mS+v2OZLbJPrqwnfp09tmL
	1NVZVKEJFD+QOrgtt7duYcEbvAPDiN75A0PfQpzbL1HwBUU1hOpdjjWEkE6upyBBNH1TE8ekTiE
	1OHCy8D/YcdrXhJrHuc/mjJ6gJj+9eGGflxflGjxkkpVVMdF+FtmavVqkLYGf7vxBLEFg9aGevH
	NX+2gy6dA8ACsiyJhH+pSR2hcZ/zy7OmgIDXs24wB1V+Z6N0oXUdjkju07ho3bdv/iZzySdsS1Q
	/7GDlISEZ4q01BwReuRuyz79yjfen/EKhvNpeVqCpTm+B3i/NOBso0eE8yHoGRwpJbXkP6OTT6W
	N/kkE34X3w2GE5iOBAvBPREUqmfqUuG2MtAUiy/nBJaWELKSTnETnVXYPoh0/EQ8ZBUK0=
X-Received: by 2002:a05:6000:3112:b0:487:faa:b1e0 with SMTP id ffacd0b85a97d-48b1270fb9amr2477283f8f.12.1790917589467;
        Thu, 01 Oct 2026 22:06:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fa61csm3083895f8f.17.2026.10.01.22.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 22:06:28 -0700 (PDT)
Date: Fri, 2 Oct 2026 08:06:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 18/18] fs/smb/client/sess.c:310
 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface'
 (line 308)
Message-ID: <202610020116.n8KvKthY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   e2d429338ffa976942aba4887d0b8a7e07dc0267
commit: e341b7975bd72d3ebda92b8d747d0aad15ce8717 [18/18] cifs: handle when server stops supporting multichannel
config: x86_64-randconfig-2200-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020116.n8KvKthY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610020116.n8KvKthY-lkp@intel.com/

smatch warnings:
fs/smb/client/sess.c:310 cifs_disable_secondary_channels() error: dereferencing freed memory 'iface' (line 308)

vim +/iface +310 fs/smb/client/sess.c

e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  285  void
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  286  cifs_disable_secondary_channels(struct cifs_ses *ses)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  287  {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  288  	int i, chan_count;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  289  	struct TCP_Server_Info *server;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  290  	struct cifs_server_iface *iface;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  291  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  292  	spin_lock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  293  	chan_count = ses->chan_count;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  294  	if (chan_count == 1)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  295  		goto done;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  296  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  297  	ses->chan_count = 1;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  298  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  299  	/* for all secondary channels reset the need reconnect bit */
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  300  	ses->chans_need_reconnect &= 1;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  301  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  302  	for (i = 1; i < chan_count; i++) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  303  		iface = ses->chans[i].iface;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  304  		server = ses->chans[i].server;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  305  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  306  		if (iface) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  307  			spin_lock(&ses->iface_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16 @308  			kref_put(&iface->refcount, release_iface);
                                                                                                                   ^^^^^^^^^^^^^
iface released

e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  309  			ses->chans[i].iface = NULL;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16 @310  			iface->num_channels--;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  311  			if (iface->weight_fulfilled)
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  312  				iface->weight_fulfilled--;

and then dereferenced.  Use after free.

e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  313  			spin_unlock(&ses->iface_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  314  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  315  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  316  		spin_unlock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  317  		if (server && !server->terminate) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  318  			server->terminate = true;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  319  			cifs_signal_cifsd_for_reconnect(server, false);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  320  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  321  		spin_lock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  322  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  323  		if (server) {
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  324  			ses->chans[i].server = NULL;
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  325  			cifs_put_tcp_session(server, false);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  326  		}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  327  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  328  	}
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  329  
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  330  done:
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  331  	spin_unlock(&ses->chan_lock);
e341b7975bd72d fs/smb/client/sess.c Shyam Prasad N 2026-07-16  332  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

