Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F33ACA62
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486236; cv=none; b=suaZWKoNghvueclpP399z7vcNY8ruGRlJfmyvLBDMnjEvrM5hO0/mmSY42BOEXpKtwLL6afkrdUHeHNtwkEw+WSZGqC/wFW1CKAVH5TmA1Etyo8cxwS0Ooiv3fhsswhybgjMXOfzfRDu3CcbnIjEDrHE29e9pdrt/gD/6m6Yy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486236; c=relaxed/simple;
	bh=ru3duGHXDkVmv8JGCmgXRMljYeKtJwyvnVrIDnm5YQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1oZ8yWS1DzaTaTICBLz8REB7euYqI1Ph7UblFXFWLdvaxKO1WVf+10j2JBtCxsSO+BeufCRP6A5zNWwrWfvgJt9PHbj1xr395+Wu+XrvtZTKYeFivVTT6YiGb8HUxrMgM3IyPd5l3iPAw4fjA0HeGkcnsKuBNT1a2rPm9dEpCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2b4583f0a1aso24773955ad.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 00:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486222; x=1779091022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtfb9HyJCOsyqLRximz4+i4Nhc4/ec2A3CErNEubLZA=;
        b=nqes3OCyS/GxoCDPApDv+ETw6cutGUmM8YbNDf2Vr1tY7lmQf/9fgcyk+uONIsBPxs
         Jskm8Jj4Q4cbIk2wuYFsJ4Grl+FYz2/BDLwL5V3vVOh1qHo1UULqAnQD6+ynrfHvBlIA
         D1GnEnWg7/MODhTmOgRNY8lmoe/loAci3+el6C3sQ0SBEjhfHn3rVR4tJaZ0hDb9TOg4
         YSDg6GSJzThMKDYS7M5q0R6fsXAOWWZkyUIzo++s2p/UK9kQY4/39kYFk8hJ9vMuY/jm
         UZMHP6Aqvgoo08z0Bs39wzJZ9g9sNKaRr1KL8OcCsHHhs7x+TV25l7GWjPBccGpCh2Hl
         WHlw==
X-Forwarded-Encrypted: i=1; AFNElJ/fVVAAQkiUuRDJHA8lsD1EKzjfbgeMRavrngs5cywXNf8FobpV1+oTsezKiOmBnuZo/vyIjCwuWLHDnBgz@lists.linux.dev
X-Gm-Message-State: AOJu0YzJd8f2FnWq0nDZuWB5DkPochGt/Ec+EJ0PT5okJ5jduckHurbp
	7XpLIGNoXWrNXq1QtcYVZJXbQiIpiiMsuV7PT9bqSuIE7dTgyH5Lzh6b
X-Gm-Gg: Acq92OEFxnNExzhXtwpwJT8SyDPpkE8pTc+L5k/qFL/ItDPDzcQUDxTJIHvnDmywBAG
	Yqcnpj90WLsUPfivgvHix4uFxAiUflQrWOjuDFptYO1MLcUOdjosqh6aYZXtiv86VLBdvKiTTps
	/c50E/7M7Q8Mt3NscaoiKE3X+Z055k2bKU7lvqEEY0RzHDNYK93m/+T31okbmeDdkSC0XZ4YzLg
	DbCamhU/VGWk5L6pI50pZqzX7umsfXmdKDKwzoOq0jZYLWJ6f6mfeHF1qIZx+k75qcoFbdhYUqc
	dEW2ANZ0qo3y4Z5Aa3FVcOp67XC5jz3UAKpaJ6QmoWUGrpAnFJDgOe99T2IzZv+HnY6UpkeLNBD
	2jCAAMQZFm8XKRxFDLidE6xnltC/MPFtkr23qIn7sX3SawyN9Mp1cxBrQYQ4RUE8/Vrc2YwfpMq
	l+wsN9FgAWf+Cn29C8UMj4u8jNT66w7cH+otklgsJot31KtGmLsK198Y4=
X-Received: by 2002:a17:902:da86:b0:2b4:5b9e:4edd with SMTP id d9443c01a7336-2bc7a9a7838mr94189145ad.9.1778486221628;
        Mon, 11 May 2026 00:57:01 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm96889215ad.28.2026.05.11.00.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:57:01 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: lkp@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	llvm@lists.linux.dev,
	luoxueqin@kylinos.cn,
	oe-kbuild-all@lists.linux.dev,
	pierre.gondois@arm.com,
	rafael@kernel.org,
	sumitg@nvidia.com,
	viresh.kumar@linaro.org,
	zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com
Subject: [PATCH v3] cpufreq: cppc: Add update_limits support for Highest Performance changes
Date: Mon, 11 May 2026 15:56:47 +0800
Message-ID: <20260511075647.206642-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202605101404.fqz0MXIe-lkp@intel.com>
References: <202605101404.fqz0MXIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI CPPC specification requires OSPM to re-evaluate the Highest
Performance register when Notify(0x85) is received for a processor
device.

Implement cppc_cpufreq_update_limits() to refresh the cached
highest_perf capability through cppc_get_highest_perf() and update
policy->cpuinfo.max_freq accordingly.

When autonomous selection mode is enabled, reprogram the runtime
MIN_PERF/MAX_PERF envelope against the updated Highest Performance
capability through cppc_cpufreq_set_autonomous_perf().

--
change v2->v3:
- Fix build issues reported by kernel test robot
- Fold cppc_cpufreq_set_autonomous_perf() refactoring into
  this patch to keep it self-contained

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605101404.fqz0MXIe-lkp@intel.com/
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpufreq/cppc_cpufreq.c | 89 +++++++++++++++++++++++++++++-----
 1 file changed, 76 insertions(+), 13 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 7e7f9dfb7a24..9184d5570de8 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -843,6 +843,80 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
 	return 0;
 }
 
+/**
+ * cppc_cpufreq_set_autonomous_perf - Configure performance bounds for
+ *                                     autonomous mode
+ * @policy: cpufreq policy structure
+ *
+ * When enabling autonomous selection, program MIN_PERF and MAX_PERF from
+ * current policy limits so that the platform uses the correct performance
+ * bounds immediately.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int cppc_cpufreq_set_autonomous_perf(struct cpufreq_policy *policy)
+{
+	struct cppc_cpudata *cpu_data = policy->driver_data;
+	u32 old_min_perf = cpu_data->perf_ctrls.min_perf;
+	u32 old_max_perf = cpu_data->perf_ctrls.max_perf;
+	int ret;
+
+	cppc_cpufreq_update_perf_limits(cpu_data, policy);
+
+	ret = cppc_set_perf(policy->cpu, &cpu_data->perf_ctrls);
+	if (ret) {
+		cpu_data->perf_ctrls.min_perf = old_min_perf;
+		cpu_data->perf_ctrls.max_perf = old_max_perf;
+		return ret;
+	}
+
+	return 0;
+}
+
+static void cppc_cpufreq_update_limits(struct cpufreq_policy *policy)
+{
+	struct cppc_cpudata *cpu_data = policy->driver_data;
+	u64 prev_highest_perf;
+	u64 highest_perf;
+	u64 nominal_perf;
+	int ret;
+
+	guard(cpufreq_policy_write)(policy);
+
+	prev_highest_perf = cpu_data->perf_caps.highest_perf;
+
+	ret = cppc_get_highest_perf(policy->cpu, &highest_perf);
+	if (ret)
+		return;
+
+	if (highest_perf == prev_highest_perf)
+		return;
+
+	cpu_data->perf_caps.highest_perf = highest_perf;
+	nominal_perf = min_t(u64, highest_perf,
+			     cpu_data->perf_caps.nominal_perf);
+
+	policy->max = cppc_perf_to_khz(&cpu_data->perf_caps,
+			policy->boost_enabled ?
+			highest_perf : nominal_perf);
+
+	policy->cpuinfo.max_freq = policy->max;
+
+	/*
+	 * Autonomous selection mode uses MIN/MAX performance as runtime
+	 * hardware control bounds.
+	 *
+	 * Re-program them when highest_perf changes.
+	 */
+	if (cpu_data->perf_ctrls.auto_sel)
+		cppc_cpufreq_set_autonomous_perf(policy);
+
+	pr_debug("CPU%d: highest_perf updated %llu -> %llu\n",
+		 policy->cpu,
+		 prev_highest_perf,
+		 highest_perf);
+}
+
 static ssize_t show_freqdomain_cpus(struct cpufreq_policy *policy, char *buf)
 {
 	struct cppc_cpudata *cpu_data = policy->driver_data;
@@ -885,20 +959,8 @@ static ssize_t store_auto_select(struct cpufreq_policy *policy,
 	cpu_data->perf_ctrls.auto_sel = val;
 
 	if (val) {
-		u32 old_min_perf = cpu_data->perf_ctrls.min_perf;
-		u32 old_max_perf = cpu_data->perf_ctrls.max_perf;
-
-		/*
-		 * When enabling autonomous selection, program MIN_PERF and
-		 * MAX_PERF from current policy limits so that the platform
-		 * uses the correct performance bounds immediately.
-		 */
-		cppc_cpufreq_update_perf_limits(cpu_data, policy);
-
-		ret = cppc_set_perf(policy->cpu, &cpu_data->perf_ctrls);
+		ret = cppc_cpufreq_set_autonomous_perf(policy);
 		if (ret) {
-			cpu_data->perf_ctrls.min_perf = old_min_perf;
-			cpu_data->perf_ctrls.max_perf = old_max_perf;
 			cppc_set_auto_sel(policy->cpu, false);
 			cpu_data->perf_ctrls.auto_sel = false;
 			return ret;
@@ -1009,6 +1071,7 @@ static struct cpufreq_driver cppc_cpufreq_driver = {
 	.init = cppc_cpufreq_cpu_init,
 	.exit = cppc_cpufreq_cpu_exit,
 	.set_boost = cppc_cpufreq_set_boost,
+	.update_limits = cppc_cpufreq_update_limits,
 	.attr = cppc_cpufreq_attr,
 	.name = "cppc_cpufreq",
 };
-- 
2.43.0

