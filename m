Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E218BE49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705472152; cv=none; b=XGpDy4jzhBqAa/6R+k//IzGZMn7eYaecXmUkQJ9KQCw35HqYfTYZNA0Ptb4/0/ZSP+DWN6lmRAIsTBfJBSZMq4yC0BwEramp+i4d1FGRwxrvRJBJnOSscmx3w7WNBf0sZQLlpXOVqMKbqh57uI5QLqg9ZbXAp//KB0I4gNHgqGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705472152; c=relaxed/simple;
	bh=IYtKiwkcGf35fFtClF9Hj+MdeHfClvgl9++eB2JXaT8=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition; b=RYCT6afwdNnvdZ2G49Vpp0irHuEfz1+JB4Dy/mwnqxrm0fZpOMrdjfRLe6YSndPSAT06JpnMLGkB472/ug75xMWxY3OlKoK18AK4RG4GDf7TSWYpJzTuHl0/vhD/RRqKJIXUArGX6yud/GA+kDb33bZ+bf8yJS4fXziptecTrzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8djCXXS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8djCXXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705472150; x=1737008150;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IYtKiwkcGf35fFtClF9Hj+MdeHfClvgl9++eB2JXaT8=;
  b=m8djCXXSMZBHW/XQE+r05bTHQMAGOMb+gEja40R74fBqp5JSKpalXBc+
   kbxTYkRgttgksB2oyKgg6dw6nzolchYPDt/wzVaphcZXOH11rhUuYKSeX
   fsmB/i84XlxDDiwj6fy99LrncN0b9h/l4C4NfgAyGOilX5lnwb+xyPcON
   96erMQHgNVMbJAcOdchvmQ+D67Z7IIFfgsMbEzKFzCdUTw0YBuUir5Bok
   HY/0Cd9bNpRbcK3r9P3GhIcOUZQTHZo+0S7TxO0m5gTLtZhpbp+H8bHfc
   CvBkpTS1iZ9nENUWofp3gx/Uu8oAscoxFQYg2CaCFTAmXa3abbkQ5cLEk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21559778"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21559778"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 22:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="907637234"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="907637234"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jan 2024 22:15:48 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPzDF-0001g8-2X
	for oe-kbuild-all@lists.linux.dev;
	Wed, 17 Jan 2024 06:15:45 +0000
Date: Wed, 17 Jan 2024 14:15:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.14-rebase 5828/9999]
 drivers/input/touchscreen/atmel_mxt_ts.c:1271:6: warning: variable
 'touch_peak' set but not used
Message-ID: <202401171405.TXbKCDJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: acbc532ef3ae9e8565fee69b7e0b060be42aebdd [5828/9999] CHROMIUM: Input: atmel_mxt_ts - Move driver from 4.4.166
config: i386-buildonly-randconfig-002-20240117 (https://download.01.org/0day-ci/archive/20240117/202401171405.TXbKCDJX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171405.TXbKCDJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401171405.TXbKCDJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/atmel_mxt_ts.c: In function 'mxt_input_touchevent_T100':
>> drivers/input/touchscreen/atmel_mxt_ts.c:1271:6: warning: variable 'touch_peak' set but not used [-Wunused-but-set-variable]
     int touch_peak = 0;
         ^~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c: In function 'mxt_asprintf':
>> drivers/input/touchscreen/atmel_mxt_ts.c:3015:2: warning: function 'mxt_asprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     len = vsnprintf(NULL, 0, fmt, aq);
     ^~~
   drivers/input/touchscreen/atmel_mxt_ts.c:3024:2: warning: function 'mxt_asprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     ret = vsnprintf(*str + *str_size, len + 1, fmt, ap);
     ^~~
   In file included from include/linux/acpi.h:27:0,
                    from drivers/input/touchscreen/atmel_mxt_ts.c:15:
   drivers/input/touchscreen/atmel_mxt_ts.c: In function 'mxt_check_bootloader':
   include/linux/device.h:1354:36: warning: this statement may fall through [-Wimplicit-fallthrough=]
    #define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:891:3: note: in expansion of macro 'dev_info'
      dev_info(&client->dev, "bootloader version: %d\n",
      ^~~~~~~~
   drivers/input/touchscreen/atmel_mxt_ts.c:893:2: note: here
     case MXT_WAITING_FRAME_DATA:
     ^~~~
   arch/x86/include/asm/bitops.h: Assembler messages:
   arch/x86/include/asm/bitops.h:97: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:97: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:97: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:97: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'


vim +/touch_peak +1271 drivers/input/touchscreen/atmel_mxt_ts.c

  1257	
  1258	static void mxt_input_touchevent_T100(struct mxt_data *data, u8 *message)
  1259	{
  1260		struct device *dev = &data->client->dev;
  1261		struct input_dev *input_dev = data->input_dev;
  1262		u8 reportid = message[0];
  1263		u8 *payload = &message[1];
  1264		u8 status = payload[0];
  1265		u8 event = status & 0x0F;
  1266		int id;
  1267		int x, y;
  1268		int area = 0;
  1269		int pressure = 0;
  1270		int touch_major = 0;
> 1271		int touch_peak = 0;
  1272		int next_index = 1;
  1273		int vector1 = 0, vector2 = 0;
  1274		int touch_type;
  1275		int distance;
  1276	
  1277		id = reportid - data->T100_reportid_min - 2;
  1278	
  1279		x = (payload[next_index+1] << 8) | payload[next_index];
  1280		next_index += 2;
  1281		y = (payload[next_index+1] << 8) | payload[next_index];
  1282		next_index += 2;
  1283	
  1284		/* Keep the process sequence */
  1285		if (data->T100_enabled_vector) {
  1286			/* The two vector components are 4-bit signed ints */
  1287			u8 values = payload[next_index];
  1288			vector1 = (signed)((signed char)values) >> 4;
  1289			vector2 = (signed)((signed char)(values << 4)) >> 4;
  1290			next_index += 1;
  1291		}
  1292	
  1293		if (data->T100_enabled_amplitude) {
  1294			pressure = payload[next_index];
  1295			next_index += 1;
  1296		}
  1297	
  1298		if (data->T100_enabled_area) {
  1299			area = payload[next_index];
  1300			touch_major = get_touch_major_pixels(data, area);
  1301			next_index += 1;
  1302		}
  1303	
  1304		if (data->T100_enabled_peak) {
  1305			touch_peak = payload[next_index];
  1306			next_index += 1;
  1307		}
  1308	
  1309		/*
  1310		 * Currently there is no distance information for hovering,
  1311		 * however, this can be used as hovering indication in user space.
  1312		 */
  1313		touch_type = ((payload[0] & 0x70) >> 4);
  1314		if (touch_type == TOUCH_STATUS_TYPE_HOVERING) {
  1315			distance = DISTANCE_HOVERING;
  1316			pressure = 0;
  1317		} else {
  1318			distance = DISTANCE_ACTIVE_TOUCH;
  1319			if (pressure == 0 && is_hovering_supported(data))
  1320				pressure = 1;
  1321		}
  1322	
  1323		dev_dbg(dev,
  1324			"[%u] T%d%c %s x: %5u y: %5u a: %5u p: %5u m: %d v: [%d,%d]\n",
  1325			id,
  1326			touch_type,
  1327			(status & TOUCH_STATUS_DETECT) ? 'D' : ' ',
  1328			mxt_event_to_string(event),
  1329			x, y, area, pressure, touch_major, vector1, vector2);
  1330	
  1331		data->current_id[id] = status & TOUCH_STATUS_DETECT;
  1332		if (touch_type != TOUCH_STATUS_TYPE_STYLUS) {
  1333			if (status & TOUCH_STATUS_DETECT) {
  1334				if (event == TOUCH_STATUS_EVENT_MOVE ||
  1335						event == TOUCH_STATUS_EVENT_DOWN ||
  1336						event == TOUCH_STATUS_EVENT_UNSUP ||
  1337						event == TOUCH_STATUS_EVENT_NO_EVENT) {
  1338					input_mt_slot(input_dev, id);
  1339					input_mt_report_slot_state(
  1340						input_dev, MT_TOOL_FINGER, true);
  1341					input_report_abs(input_dev,
  1342							 ABS_MT_POSITION_X, x);
  1343					input_report_abs(input_dev,
  1344							 ABS_MT_POSITION_Y, y);
  1345					input_report_abs(input_dev,
  1346							 ABS_MT_PRESSURE, pressure);
  1347					input_report_abs(input_dev,
  1348							 ABS_MT_DISTANCE, distance);
  1349					input_report_abs(input_dev,
  1350							 ABS_MT_TOUCH_MAJOR,
  1351							 touch_major);
  1352				}
  1353			} else {
  1354				if (event == TOUCH_STATUS_EVENT_UP) {
  1355					input_mt_slot(input_dev, id);
  1356					input_mt_report_slot_state(input_dev,
  1357								   MT_TOOL_FINGER,
  1358								   false);
  1359				} else if (event == TOUCH_STATUS_EVENT_SUP) {
  1360					/*
  1361					 * Suppressed touches will be reported as
  1362					 * touches with maximum ABS_MT_TOUCH_MAJOR.
  1363					 * The controller no longer reports suppressed
  1364					 * touches, so we have to release the touch
  1365					 * afterwards.
  1366					 */
  1367					int max = input_abs_get_max(input_dev,
  1368								    ABS_MT_TOUCH_MAJOR);
  1369					input_mt_slot(input_dev, id);
  1370					input_report_abs(input_dev,
  1371							 ABS_MT_TOUCH_MAJOR,
  1372							 max);
  1373					input_sync(input_dev);
  1374	
  1375					input_mt_report_slot_state(input_dev,
  1376								   MT_TOOL_FINGER,
  1377								   false);
  1378				}
  1379			}
  1380		} else {
  1381			input_mt_slot(input_dev, id);
  1382			input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, false);
  1383		}
  1384	}
  1385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
