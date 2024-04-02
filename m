Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46780BEE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068000; cv=none; b=lOqsdpBkYHYGWS+qek6D7zKz+w8tizrXi32SmA6PQpDOj1PmOIIzoQ4kP3xGlHFiYABDDQUSZHmoLnbfkuZEE4jiamJVVw4DKZ+GaZ2SBy2uDAOrH1b9n545QNRyq4d1gxs+QOCNba81q+pHZWpPvbycpGkJvefJkWCRhGgZyIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068000; c=relaxed/simple;
	bh=wb8OcmZ8nXTF7Q/pPY/cMHwBIXLq8TNaTC1r4auayRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DhdCWTwxbi2Ze74dj2S2eJmmxQBxRVILypXgFEJFCY5bDYZmbaLGRjlxxTfNrg1NhSGbP6rWTKzr9/z4Y8oQZ+cF8Gt6tgjh1L11YXzljzogkPpEHmdwxMDyoc520lwD7hDev5e/qSimnER20XCJSQ8UJj54Zc8IZN86pPgGvgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bO8D5l8k; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bO8D5l8k"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4e61accceaso342183466b.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Apr 2024 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067997; x=1712672797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upUzUEpU3Za2df9fsOBRHScChgN1x/fSuDcg3jaeZkY=;
        b=bO8D5l8kZS5YauJdOrHN+5jPgEizTu1Y/vCEMCehEe9CgjIqdJQdL7uLI9otSTA/p8
         TlbJ1mGona5hlEjz1WSZbdhGGfyO6cVLRCKmxEqlogwR/zjFuaYy5Y1rNm0lJ/Ffpszy
         dQwVqHQJ4qbPl9htvn8LV4qQSTLvVjGDhjLKrT6el7Q9z0KqUuJXpMz+jWJPk4+wyWIZ
         qX1cadx9wH8WDbZ/KoByPsAgEQ09RUStPVAAN0miJocEV89AdD+HkxKQkvHmbwvElJR2
         2HjRCgZgY2iKPxtQtK7fhRwcrFj3hGxNJOHA1tUaQlLSFwc+Wy73G8n1x1ahLGc/IkJo
         NDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067997; x=1712672797;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upUzUEpU3Za2df9fsOBRHScChgN1x/fSuDcg3jaeZkY=;
        b=rDHp494Ss0GjH7T//64xSLEV/bfI0Qxcdi/mLxXxeU8ABeuUblhS73/3ryp8CjBd4R
         radV9O3/0XOKS14G79eC/ov/qirATBWYFj1S8TE8TVn/mXHFfPIDrTLctkTVDG+n3vt7
         8WSEBiAxfc2dpi38LhQY6xN090nUEj4b5O7mChhlWzOzRnLeLIEpS+Nt8YTA8+49vzrj
         BNycuvqjD20r3gq/Jy8i0xDdGOYnGNVTxCDc6y5SSTJw+GoofvNA20QIB7EkocREQhUU
         vaon5hx03IU7hVsadbB08hr8Eh/mDFKiuEzBUk0P/4WGnvgS3UrpCZZVZWB/S8Cs8J5d
         lG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhqaSC0IboaKZIzD7yVVWUF7BRrMyZZEYR5rRYCVjVMNXP0yXOZ45Gd/ERJPmzEd2If+XSsj81xzwgMxFxbJNARDBgl1TW65GfxR8beQ==
X-Gm-Message-State: AOJu0YxVfF4gLIo1T2l+rOIhppOruvKYgRxYyH2OdN8hElwzwFc/ZgtK
	cChBANtGK3HFNd+7ueZL9skouShbfJGtldG6+uXW33jUi5piQOut8qpdclYE9Io=
X-Google-Smtp-Source: AGHT+IH1dtYnuqRm8CMg0VpPP6dS0+XrYGZJ9KZ6Sal92yBUfXnAJ0PpXqrWR7ekMrbNFa3HnIUVeg==
X-Received: by 2002:a17:906:a098:b0:a4e:114e:25cb with SMTP id q24-20020a170906a09800b00a4e114e25cbmr7194755ejy.53.1712067996646;
        Tue, 02 Apr 2024 07:26:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906a18c00b00a4672fb2a03sm6644799ejy.10.2024.04.02.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 07:26:35 -0700 (PDT)
Date: Tue, 2 Apr 2024 17:26:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1131/2532] drivers/pwm/core.c:1282
 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
Message-ID: <1e3dc81d-dcd4-4b04-85b1-23937e2f0acd@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 0835e5c8704297e91b54071c3bbcd0c05c63bd3f [1131/2532] pwm: Add support for pwmchip devices for faster and easier userspace access
config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240401/202404010703.o1yYkXrA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404010703.o1yYkXrA-lkp@intel.com/

New smatch warnings:
drivers/pwm/core.c:1282 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
drivers/pwm/core.c:1284 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'
drivers/pwm/core.c:1368 pwm_cdev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/pwm/core.c:1357 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'
drivers/pwm/core.c:1871 pwm_put() warn: variable dereferenced before check 'pwm' (see line 1869)

vim +1282 drivers/pwm/core.c

0835e5c8704297 Uwe Kleine-König 2024-03-17  1226  static long pwm_cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1227  {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1228  	int ret = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1229  	struct pwm_cdev_data *cdata = file->private_data;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1230  	struct pwm_chip *chip = cdata->chip;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1231  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1232  	mutex_lock(&pwm_lock);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1233  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1234  	if (!chip->operational) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1235  		ret = -ENODEV;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1236  		goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1237  	}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1238  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1239  	switch (cmd) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1240  	case PWM_IOCTL_GET_NUM_PWMS:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1241  		ret = chip->npwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1242  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1243  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1244  	case PWM_IOCTL_REQUEST:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1245  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1246  			unsigned int hwpwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1247  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1248  			ret = get_user(hwpwm, (unsigned int __user *)arg);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1249  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1250  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1251  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1252  			ret = pwm_cdev_request(cdata, hwpwm);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1253  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1254  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1255  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1256  	case PWM_IOCTL_FREE:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1257  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1258  			unsigned int hwpwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1259  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1260  			ret = get_user(hwpwm, (unsigned int __user *)arg);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1261  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1262  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1263  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1264  			ret = pwm_cdev_free(cdata, hwpwm);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1265  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1266  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1267  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1268  	case PWM_IOCTL_GET:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1269  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1270  			struct pwmchip_state cstate;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1271  			struct pwm_state state;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1272  			struct pwm_device *pwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1273  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1274  			ret = copy_from_user(&cstate, (struct pwmchip_state __user *)arg, sizeof(cstate));

	if (copy_from_user(&cstate, (struct pwmchip_state __user *)arg, sizeof(cstate))) {
		ret = -EFAULT;
		goto out_unlock;
	}

0835e5c8704297 Uwe Kleine-König 2024-03-17  1275  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1276  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1277  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1278  			ret = pwm_cdev_request(cdata, cstate.hwpwm);

I don't understand very much about spectre but I think maybe there is
a speculation issue inside pwm_cdev_request() where we need to add an
array_index_nospec().

0835e5c8704297 Uwe Kleine-König 2024-03-17  1279  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1280  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1281  
0835e5c8704297 Uwe Kleine-König 2024-03-17 @1282  			pwm = cdata->pwm[cstate.hwpwm];
0835e5c8704297 Uwe Kleine-König 2024-03-17  1283  
0835e5c8704297 Uwe Kleine-König 2024-03-17 @1284  			ret = pwm_get_state_hw(pwm, &state);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1285  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1286  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1287  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1288  			if (state.enabled) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1289  				cstate.period = state.period;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1290  				if (state.polarity == PWM_POLARITY_NORMAL) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1291  					cstate.duty_offset = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1292  					cstate.duty_cycle = state.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1293  				} else {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1294  					cstate.duty_offset = state.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1295  					cstate.duty_cycle = state.period - state.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1296  				}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1297  			} else {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1298  				cstate.period = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1299  				cstate.duty_cycle = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1300  				cstate.duty_offset = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1301  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1302  			ret = copy_to_user((struct pwmchip_state __user *)arg, &cstate, sizeof(cstate));
                                                                        ^^^^^^^^^^^^^^^^^^^


0835e5c8704297 Uwe Kleine-König 2024-03-17  1303  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1304  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1305  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1306  	case PWM_IOCTL_APPLY:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1307  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1308  			struct pwmchip_state cstate;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1309  			struct pwm_state state = { };
0835e5c8704297 Uwe Kleine-König 2024-03-17  1310  			struct pwm_device *pwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1311  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1312  			ret = copy_from_user(&cstate, (struct pwmchip_state __user *)arg, sizeof(cstate));
                                                                        ^^^^^^^^^^^^^^^^^^^^


0835e5c8704297 Uwe Kleine-König 2024-03-17  1313  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1314  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1315  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1316  			if (cstate.period > 0 &&
0835e5c8704297 Uwe Kleine-König 2024-03-17  1317  			    (cstate.duty_cycle > cstate.period ||
0835e5c8704297 Uwe Kleine-König 2024-03-17  1318  			     cstate.duty_offset >= cstate.period)) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1319  				ret = -EINVAL;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1320  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1321  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1322  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1323  			/*
0835e5c8704297 Uwe Kleine-König 2024-03-17  1324  			 * While the API provides a duty_offset member
0835e5c8704297 Uwe Kleine-König 2024-03-17  1325  			 * to describe (among others) also inversed
0835e5c8704297 Uwe Kleine-König 2024-03-17  1326  			 * polarity wave forms, the translation into the
0835e5c8704297 Uwe Kleine-König 2024-03-17  1327  			 * traditional representation with a (binary) polarity
0835e5c8704297 Uwe Kleine-König 2024-03-17  1328  			 * isn't trivial because the lowlevel drivers round
0835e5c8704297 Uwe Kleine-König 2024-03-17  1329  			 * duty_cycle down when applying a setting and so in the
0835e5c8704297 Uwe Kleine-König 2024-03-17  1330  			 * representation with duty_offset the rounding is
0835e5c8704297 Uwe Kleine-König 2024-03-17  1331  			 * inconsistent. I have no idea what's the best way to
0835e5c8704297 Uwe Kleine-König 2024-03-17  1332  			 * fix that, so to not commit to a solution yet, just
0835e5c8704297 Uwe Kleine-König 2024-03-17  1333  			 * refuse requests with .duty_offset that would yield
0835e5c8704297 Uwe Kleine-König 2024-03-17  1334  			 * inversed polarity for now.
0835e5c8704297 Uwe Kleine-König 2024-03-17  1335  			 */
0835e5c8704297 Uwe Kleine-König 2024-03-17  1336  			if (cstate.duty_cycle < cstate.period &&
0835e5c8704297 Uwe Kleine-König 2024-03-17  1337  			    cstate.duty_offset + cstate.duty_cycle >= cstate.period) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1338  				ret = -EINVAL;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1339  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1340  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1341  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1342  			ret = pwm_cdev_request(cdata, cstate.hwpwm);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1343  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1344  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1345  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1346  			pwm = cdata->pwm[cstate.hwpwm];
0835e5c8704297 Uwe Kleine-König 2024-03-17  1347  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1348  			if (cstate.period > 0) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1349  				state.enabled = true;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1350  				state.period = cstate.period;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1351  				state.polarity = PWM_POLARITY_NORMAL;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1352  				state.duty_cycle = cstate.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1353  			} else {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1354  				state.enabled = false;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1355  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1356  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1357  			ret = pwm_apply_might_sleep(pwm, &state);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1358  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1359  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1360  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1361  	default:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1362  		ret = -ENOTTY;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1363  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1364  	}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1365  out_unlock:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1366  	mutex_unlock(&pwm_lock);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1367  
0835e5c8704297 Uwe Kleine-König 2024-03-17 @1368  	return ret;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1369  }
0835e5c8704297 Uwe Kleine-König 2024-03-17  1370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

