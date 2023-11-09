Received: from sonic304-27.consmr.mail.ne1.yahoo.com (sonic304-27.consmr.mail.ne1.yahoo.com [66.163.191.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA587225CD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="BuQwAfyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1699550443; bh=2loIJ9Mc1k5x3QeZK+Bf8y+wWRsgkP6BMVROUhRo5Q0=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=BuQwAfydM8gbfAa8l3DCVy+Lx7ek32lUTPsonmED4zg3RTj0OkfgTC0Te7uPhRGuqT+Bcd9URFOkQ2UNIP32xO6+fmJ+z0sfVrcHylAJRJaHZD7hNc0orh3g1+4rqNu7fLRHhPokfQNDePuAvG7i6w2U7VKB+poUk/0E8o6UIqtjRJ+AssK44CrDSo8kIs3bB2Ki9m9yRXWHT5QYwY+blPiwFdXA35b6x6k/3OYL7o9Lc3TpsTGpP0L54fdvOnqEsjHrib5X5lhK2EsQnrJTdduLC0OSTBZtd7TOIwQC413C31933Bgv8Cw77BxlO9kF7ZqdC/R0MkVmsjRO4H5oOg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1699550443; bh=HV2S1Ub1btykE1zDk5uqZwcd4spcVpEqC7pMJSEZZ1W=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=S7MjUEkwbmQjnF2yZ8rhUkjGGwJ3/sJdFdHYcUZN3Cj2eypIGY1jDKKS37he5yJV3oa1AegBq3j29Qn0efJ9mdfFK1RP/w4BiYq6duWZ3X201iRywZznsYR26XZucE4Ct0RE/i1kFGNhtiJUzMjlz4u13/RtO6WbWse6rCU3EOqE3Jp6c66y6VmkGrMhppH0QxgVx5VLKSz8yqFu/USY8ichzEu/k2aPxnIvD2B1v7C+yGyi1zMzxjfw87sYBESPW4eRXrSQKEKfjTniooeuzXB9b55MQCHZ4mXFqTH9uexItAaPRiKLd0RfNLjH9pSOcLt70Py1ttZOovlYxRwRmQ==
X-YMail-OSG: 1_QuhdMVM1l0BxaoK2_8WzFRYUZWzJyAbRknT2OpBjtKybCESpv8naGz1s.WzHk
 KXg95Xjup3irI1py.69FEuI5KS0kqZnMNPtPMyJBAWdjve9OmMhRR.hORBYcikI9XIAJJeYAyFEx
 X5OxggQ1HgRGuRQeDTyjJ4wd4NKcSebq4yjGHC8K4wycnvrwFokw48jLYjggcTm2ETYL7tDLnzcC
 3iXbEt2Pg8DHGtpukfBXHnfB.9ScZZctPC8zCqWTOpaBPsWzNBuMV4i0GMZ2rfhRCMEw2yWEMZhY
 Z_IsjHG1KtPFGqKSOjBs1520d7MPDyJMBzPpgbkiDeLRq83LJh_Q5vhKJYdeGciTeiXB8bXtvwQA
 m.9bx8eKra6bqk_KnjGhmy8QFUXM0Euvb9QwmHI_N1VsoLAJV8JqqoTtN4LSEjKJ_zhSkiT7ZC_B
 FuXh0UBghYgkLgIEK3llhOj3kLGAF.axUCh1I6M6fYSxiWtbtRbEjZiAMIDX0XxqTqXNlwxjS4QM
 TbN4drwAyS2gIRfWZqOQ4T.5MSOFy_Vfv3IxjeWn5TcIcWbcs2FCejQZszyCj3Kh4CQ6AVZb_DFU
 FwZdzmVG29NaXv9orOZgoALhXbXWTZcudaLm6J_wjbpTDwX4woizIpw_nUEYjn2xL1Vu_xM7j7jQ
 HTQtF71p6NhGO1jfvJG9X1baQWjB_VtEUVt4bmzBHCtda7TgQOMfLQKcYRiIYHsdn.e.AhUSPYO1
 ChyRYfKbdpKivGr6FutiegD1dX39XVADCFxqhkN5ozTqdofTOgWE4x_fumrwfSbfj3D9BeEpCQqU
 vfb3GNkG9DCgA7MZnFWPJ0gumauqu5508Zr3JHuLEFt8cLlYwX1cu9UEYu8ppr8jiYbxCmqm9TJK
 TwqRnE09cta30pYkGHoUpf64PX8rP0PiJnF5H7QU4KSo05UibKn8ywKSIZgLhyC7AKpZeD7ce3NQ
 9ilAnn9aFp47ftu.g8hktNizLdBMoL8NwhaqBBVDCYoCwB.sehrDbtfx_mJHUkelIurYq6NJISRu
 cCl8yr659KdrZHMQIwCqcNYQyTgADgkz1KjLuiU5ZhBqPnB1XleCbcQ.PAvCEvR7._k7PCv1UlrI
 sXoqk3FNVJdF1GaTHf61U0VrTY2Nm7l3kOkEYC7_NFCJQJKziIAGW8z_XXgGqOYRVlnCdPdI2kOc
 .6vKzevw8Dj41YB4ci9q3FHSu2AduMu_rXiOw6LPnJc0RmGfAHPQcQdBfzAZcVzmVk7q2cTGBenm
 Q.0tQxojGRUPsQMzkVwPme_Ogxps1clYSMwjPbuzkTyUuh8C8ZpD5QHB1B2vqRNeCq.MI5zoXOjq
 NxDUFGrh9HzRfZnTF7PFJeaHvvpqkPab9EXDJTzk1Nm8T25ueJCm0sv9mqpDXQeK82eTIOLPPTlW
 sNB4214lCX1k42_Hyen.hakJPFjkw626eVGrGb5gqqQAut69cg6PG1U3hccGy3hUEDwhcB6kNVpq
 idASO4cDu.Hja8lfTgWwR63yzmDQy8E5XBTlzLJs.rD90uInMUwQkBbLlTk9TSyqsL0im6aqfiJy
 z8ggSTw4CjK7TFX3Z7x2.UjLxpgQAQBio9VmQu0pL0cFGKkhm2AokfGxyLxrDdqJippHNRLnNnQZ
 dsqbAurBErfM_Ej3OoaLUr7o5wJOwC_yKruJmiAmEMql_7eWYegYJatFlQpbhIl3lOIqzv1FtLw1
 iuJ44ec6mVfDa_LR.LEfRaMk.b4ophmHSq8FHR_.Eiq3nbkUDs6EsMsXpk9BTiLEtzWMuNG58WFl
 4drD5xNBjVvqtS7Vv9.jtJ6ebBY5elQq2YBP3Ue2eHBMG.gV.psokAw7p40sys5xMj_zIUoJjNBT
 CO1HeD95Ql.JwPi44EI_kZ9ucoZYdWc0OouTFZUdBOTIDWE8lsRtkSsosF6YnXja7EjfZy8bBDV9
 bgldrsaekAFb032OCMXh3_Ae9gNLTFIMO1qVi9mJvXPwlzTP68FqB2xU7gXXTl4wV42O2HevSvGz
 rCVyhcqju4EUhsGyO7eE5we3eT_zty6B.udd5oYgs.kB47sSJLB3Ym8aYHOu2gJhXwsluiCNke_Q
 SkhtFmTC95EMBJSgCdyLHQIM_d7aO5UC4jSQGx7MYiUqDJlG_j0o5H3i_IZ6qHB3SIxFsC20GazM
 YUNQ5b_jXepWMwCkLBoYVqpY1348gogMWhPytyyhZ0NV0lJWZbXzZXdEdp3_R1yJ_Ph.JYKSJZAV
 ScMaCw511XHOJ7r9X.yRSFtTKuwagIyDwR9OQP8LrBeGLO50p50ipZAIu6Wdml.zB1OzvXJ0aJk4
 6wuOJ
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 4b3f7eeb-9786-46cb-8fe0-6e6f97721557
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Thu, 9 Nov 2023 17:20:43 +0000
Received: by hermes--production-bf1-5b945b6d47-b72k6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 72267c429239bb8b108ba2161c10cfb0;
          Thu, 09 Nov 2023 17:20:38 +0000 (UTC)
Message-ID: <7129128d-d20e-4752-8cfd-e81758c913a7@schaufler-ca.com>
Date: Thu, 9 Nov 2023 09:20:35 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [pcmoore-lsm:dev-staging 1/16] security/tomoyo/tomoyo.c:546:21:
 sparse: sparse: symbol 'tomoyo_lsmid' was not declared. Should it be static?
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
 Kees Cook <keescook@chromium.org>, Serge Hallyn <serge@hallyn.com>,
 Mickael Salaun <mic@digikod.net>, John Johansen
 <john.johansen@canonical.com>, Casey Schaufler <casey@schaufler-ca.com>
References: <202311030352.rlmE6sKL-lkp@intel.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <202311030352.rlmE6sKL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21896 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 11/2/2023 12:47 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git dev-staging
> head:   bb92b5b887051b8448e0a06d39b9c89d42e347f8
> commit: 08a8af0d456ecddadee1071cb614f3b7873e808e [1/16] LSM: Identify modules by more than name
> config: x86_64-randconfig-123-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030352.rlmE6sKL-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030352.rlmE6sKL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311030352.rlmE6sKL-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> security/tomoyo/tomoyo.c:546:21: sparse: sparse: symbol 'tomoyo_lsmid' was not declared. Should it be static?

I pulled the "static" from the lsm_id declarations because they are also "const".
It looks as if that was a mistake, and the "static" should come back.

It's a simple patch. I can provide it in a day or two ( slow internet :( ) or
someone else can snap a "static" in front of the "struct lsm_id" use in each
of the LSM definitions. All LSMs need it except for landlock.

